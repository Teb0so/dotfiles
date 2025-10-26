if [ $(cat /etc/hostname) == highrock ]; then
    export QT_STYLE_OVERRIDE=windows
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export XDG_DATA_DIRS="/home/teb0so/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"


export TERM=alacritty
export EDITOR=nvim

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/tmp/xdg-runtime-dir-$UID"
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi
