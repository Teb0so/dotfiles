export QT_QPA_PLATFORMTHEME=qt5ct
export PATH="$HOME/.local/bin:$PATH"

export TERMINAL=alacritty
export EDITOR=nvim

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/tmp/xdg-runtime-dir-$UID"
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   exec startx
fi
