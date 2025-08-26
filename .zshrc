# Luke's config for the Zoomer Shell
# Edited by Teb0so

# Enable colors and change prompt:
autoload -U colors && colors
if [[ $(cat /etc/hostname) == skyrim ]]; then
    PS1='%F{grey}%B[%F{blue}%n%F{grey}@%F{blue}%m%f %F{magenta}%1~%f%F{grey}]%f%B$ '
elif [[ $(cat /etc/hostname) == highrock ]]; then
    PS1='%F{grey}%B[%F{green}%n%F{grey}@%F{green}%m%f %F{magenta}%1~%f%F{grey}]%f%B$ '
elif [[ $(cat /etc/hostname) == cyrodiil ]]; then
    PS1='%F{grey}%B[%F{red}%n%F{grey}@%F{red}%m%f %F{magenta}%1~%f%F{grey}]%f%B$ '
else
    PS1='%F{grey}%B[%F{grey}%n%F{grey}@%F{grey}%m%f %F{magenta}%1~%f%F{grey}]%f%B$ '
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zshhistory

# Read man pages in nvim
if command -v nvim > /dev/null; then
    export MANPAGER="nvim +Man!"
fi

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Aliases

# ls
alias ls='ls --color=tty'
alias la='ls -lha --color=tty'

# Grep
alias grep='grep --color=tty'

# open another terminal in current directory
alias duple="alacritty & disown"

# use fzf to start a tmux on specific directory
alias cdc='cd "$(find . -type d -print | fzf)" && tmux && cd -'

# open notes in nvim
alias notes='cd ~/notes && nvim && cd -'

# To clipboard
alias clipb='xclip -selection clipboard'

# Load other aliases.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# Load zsh-syntax-highlighting; should be last.

if [[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
