#!/usr/bin/env python3
"""Toggle-hold the right mouse button.

Press the physical right mouse button once to hold right-click down. Press it
again to release. Press Ctrl+C in the terminal to quit and release the button.

On Wayland this script uses Linux evdev/uinput. That usually requires access to
/dev/input and /dev/uinput. On X11 it can use pynput.
"""

from __future__ import annotations

import argparse
import os
import platform
import select
import sys
import threading
import time
from dataclasses import dataclass
from typing import Protocol


REPRESS_DELAY_SECONDS = 0.03
CHORD_DELAY_SECONDS = 0.08


class RightButtonEmitter(Protocol):
    def press_right(self) -> None:
        ...

    def release_right(self) -> None:
        ...


@dataclass
class ToggleState:
    emitter: RightButtonEmitter
    ignore_left_right_chord: bool = False
    held: bool = False
    physical_left_is_down: bool = False
    physical_right_is_down: bool = False

    def __post_init__(self) -> None:
        self._lock = threading.Lock()
        self._stop_event = threading.Event()
        self._pending_right_token = 0

    @property
    def stop_event(self) -> threading.Event:
        return self._stop_event

    def stop(self) -> None:
        with self._lock:
            self._pending_right_token += 1
            self._stop_event.set()
        self.emitter.release_right()

    def left_event(self, pressed: bool) -> None:
        with self._lock:
            self.physical_left_is_down = pressed
            if pressed and self.physical_right_is_down:
                self._pending_right_token += 1

    def right_event(self, pressed: bool) -> None:
        if pressed:
            with self._lock:
                self.physical_right_is_down = True
                if self.ignore_left_right_chord:
                    self._pending_right_token += 1
                    token = self._pending_right_token
                    if self.physical_left_is_down:
                        return

                    threading.Thread(
                        target=self._toggle_after_chord_delay,
                        args=(token,),
                        daemon=True,
                    ).start()
                    return

            self._toggle_hold()
            return

        with self._lock:
            self.physical_right_is_down = False
            self._pending_right_token += 1
            should_reinforce = self.held

        if should_reinforce:
            threading.Thread(target=self._reinforce_hold_after_release, daemon=True).start()

    def _toggle_after_chord_delay(self, token: int) -> None:
        time.sleep(CHORD_DELAY_SECONDS)
        with self._lock:
            should_toggle = (
                token == self._pending_right_token
                and self.physical_right_is_down
                and not self.physical_left_is_down
                and not self._stop_event.is_set()
            )

        if should_toggle:
            self._toggle_hold()

    def _toggle_hold(self) -> None:
        with self._lock:
            if self._stop_event.is_set():
                return
            self.held = not self.held
            should_hold = self.held

        if should_hold:
            self.emitter.press_right()
            print("Right-click hold: ON", flush=True)
        else:
            self.emitter.release_right()
            print("Right-click hold: OFF", flush=True)

    def _reinforce_hold_after_release(self) -> None:
        time.sleep(REPRESS_DELAY_SECONDS)
        with self._lock:
            should_hold = (
                self.held
                and not self.physical_right_is_down
                and not self._stop_event.is_set()
            )

        if should_hold:
            self.emitter.press_right()


def choose_backend(requested: str) -> str:
    if requested != "auto":
        return requested

    if platform.system() == "Linux" and os.environ.get("XDG_SESSION_TYPE") == "wayland":
        return "evdev"

    return "pynput"


def run_evdev_backend(ignore_left_right_chord: bool) -> int:
    try:
        from evdev import InputDevice, UInput, ecodes, list_devices
    except ImportError as exc:
        print(f"evdev is not available: {exc}", file=sys.stderr)
        print("Install it with your distro package manager, for example: sudo apt install python3-evdev", file=sys.stderr)
        return 1

    devices = []
    for path in list_devices():
        try:
            device = InputDevice(path)
            key_codes = device.capabilities().get(ecodes.EV_KEY, [])
            if ecodes.BTN_RIGHT in key_codes or ecodes.BTN_LEFT in key_codes:
                devices.append(device)
            else:
                device.close()
        except PermissionError:
            print(f"Permission denied while reading {path}.", file=sys.stderr)
        except OSError:
            pass

    if not devices:
        print("No readable mouse device with mouse buttons was found.", file=sys.stderr)
        print("You may need to run from a real desktop session and grant access to /dev/input.", file=sys.stderr)
        return 1

    try:
        ui = UInput({ecodes.EV_KEY: [ecodes.BTN_RIGHT]}, name="right-click-toggle")
    except PermissionError:
        print("Permission denied while opening /dev/uinput.", file=sys.stderr)
        print("Add your user to the input group or run with appropriate uinput permissions.", file=sys.stderr)
        return 1
    except OSError as exc:
        print(f"Could not create a virtual input device: {exc}", file=sys.stderr)
        return 1

    class EvdevEmitter:
        def press_right(self) -> None:
            ui.write(ecodes.EV_KEY, ecodes.BTN_RIGHT, 1)
            ui.syn()

        def release_right(self) -> None:
            ui.write(ecodes.EV_KEY, ecodes.BTN_RIGHT, 0)
            ui.syn()

    state = ToggleState(EvdevEmitter(), ignore_left_right_chord=ignore_left_right_chord)
    print("Right-click toggle is running with evdev/uinput.", flush=True)
    print("Right-click toggles hold on/off. Press Ctrl+C to quit.", flush=True)
    if ignore_left_right_chord:
        print("Left+right button chords are ignored.", flush=True)

    try:
        while not state.stop_event.is_set():
            readable, _, _ = select.select(devices, [], [], 0.1)
            for device in readable:
                for event in device.read():
                    if event.type == ecodes.EV_KEY and event.code == ecodes.BTN_LEFT:
                        if event.value == 1:
                            state.left_event(pressed=True)
                        elif event.value == 0:
                            state.left_event(pressed=False)
                    elif event.type == ecodes.EV_KEY and event.code == ecodes.BTN_RIGHT:
                        if event.value == 1:
                            state.right_event(pressed=True)
                        elif event.value == 0:
                            state.right_event(pressed=False)
    except KeyboardInterrupt:
        print("\nInterrupted.", flush=True)
    finally:
        state.stop()
        ui.close()
        for device in devices:
            device.close()

    return 0


def run_pynput_backend(ignore_left_right_chord: bool) -> int:
    try:
        from pynput import keyboard, mouse
    except ImportError as exc:
        print(f"pynput could not start: {exc}", file=sys.stderr)
        print("On Wayland, try: python3 right_click_toggle.py --backend evdev", file=sys.stderr)
        return 1

    class PynputEmitter:
        def __init__(self) -> None:
            self._button = mouse.Button.right
            self._controller = mouse.Controller()

        def press_right(self) -> None:
            self._controller.press(self._button)

        def release_right(self) -> None:
            try:
                self._controller.release(self._button)
            except Exception:
                pass

    emitter = PynputEmitter()
    state = ToggleState(emitter, ignore_left_right_chord=ignore_left_right_chord)

    def on_click(_: int, __: int, button: object, pressed: bool) -> None:
        if button == mouse.Button.left:
            state.left_event(pressed=pressed)
        elif button == mouse.Button.right:
            state.right_event(pressed=pressed)

    def on_key_press(key: object) -> bool | None:
        if key == keyboard.Key.esc:
            print("Exiting.", flush=True)
            state.stop()
            return False
        return None

    print("Right-click toggle is running with pynput.", flush=True)
    print("Right-click toggles hold on/off. Press Esc or Ctrl+C to quit.", flush=True)
    if ignore_left_right_chord:
        print("Left+right button chords are ignored.", flush=True)

    mouse_listener = mouse.Listener(on_click=on_click)
    keyboard_listener = keyboard.Listener(on_press=on_key_press)
    mouse_listener.start()
    keyboard_listener.start()

    try:
        while not state.stop_event.is_set():
            time.sleep(0.1)
    except KeyboardInterrupt:
        print("\nInterrupted.", flush=True)
    finally:
        state.stop()
        mouse_listener.stop()
        keyboard_listener.stop()

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Toggle-hold right mouse button.")
    parser.add_argument(
        "--backend",
        choices=("auto", "evdev", "pynput"),
        default="auto",
        help="input backend to use; auto prefers evdev on Wayland",
    )
    parser.add_argument(
        "--ignore-left-right-chord",
        action="store_true",
        help="do not toggle right-click hold when left and right are pressed together",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    backend = choose_backend(args.backend)
    if backend == "evdev":
        return run_evdev_backend(args.ignore_left_right_chord)
    return run_pynput_backend(args.ignore_left_right_chord)


if __name__ == "__main__":
    sys.exit(main())
