### Enable colors and change prompt
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[green]%}%~%{$fg[blue]%} ❯%b "

setopt autocd   # Automatically cd into typed directory.
setopt interactive_comments

### exports
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTCONTROL=ignoredups:erasedups
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export FZF_DEFAULT_OPTS="--layout=reverse --height 50%"
export COLORTERM='truecolor'
export TERM="xterm-256color"
export TERMINAL='st'
export EDITOR='nvim'
export READER='zathura'
export BROWSER='brave'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export _JAVA_AWT_WM_NONREPARENTING=1    # Fix for Java applications in dwm
export QT_QPA_PLATFORMTHEME="qt5ct"
export MPD_PORT="7000"

export PATH=$PATH:/home/murtaza/.local/bin

# clean up
export LESSHISTFILE="-"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/notmuch-config
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
export NUGET_PACKAGES="$XDG_CACHE_HOME/"NuGetPackages
export prefix="$XDG_DATA_HOME"/npm
export cache="$XDG_CACHE_HOME"/npm
export tmp="$XDG_RUNTIME_DIR"/npm
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password-store
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export ANDROID_HOME=$HOME/Android/SDK
export ANDROID_SDK_ROOT=$HOME/Android/SDK

### History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

### alias
alias p='sudo pacman'
alias pp="pacman -Slq | fzf --multi --preview 'pacman -Si {1}'"
alias ..='cd ..'
alias ...='cd ../..'
alias ls='exa --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lal='exa -la --color=always --group-directories-first'
alias grep='grep --color=auto'
alias v='nvim'
alias o='xdg-open'
alias config='/usr/bin/git --git-dir=$HOME/.local/share/Dotfiles/ --work-tree=$HOME'
alias vifm='bash "$HOME"/.config/vifm/scripts/vifmrun'
alias yt-dl='youtube-dl -o "$HOME/vids/%(title)s.%(ext).s" -f "bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"'
alias yt-au='youtube-dl -o "$HOME/music/%(title)s.%(ext).s" -x -f bestaudio/best'
alias myt='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]" "$url"'
alias pipall="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias nt='setsid alacritty'
alias ga='cd "$HOME"/.local/share/cell'
alias gu='cd /run/media/murtaza'
alias gn='cd "$HOME"/.config/nvim'
alias t='tmux'

# git
alias gs='git status'
alias gi='git init'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### vi mode
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

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

sp() {
    chosen="$(find "$HOME"/projects -maxdepth 1 -type d ! -name '.*' | sed 's/\/home\/murtaza\/projects\///g' | fzf -i --border sharp)"
    [ "$chosen" = "" ] || cd "$HOME"/projects/"$chosen"
}

sc() {
    chosen="$(find "$HOME"/.local/bin/ -maxdepth 1 -type f | sed 's/\/home\/murtaza\/.local\/bin\///g' | fzf -i --border sharp)"
    [ "$chosen" = "" ] || nvim "$HOME"/.local/bin/"$chosen"
}

finder() {
    chosen="$(fzf -i --border sharp --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    [ "$chosen" = "" ] || nvim "$chosen"
}

### keybindings
bindkey -s '^p' 'finder\n'

### syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
