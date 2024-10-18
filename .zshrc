# Prompt
PS1="%F{white}%~ %(!.%F{red}#.») %f"
precmd () {
  vcs_info
  RPROMPT="${vcs_info_msg_0_}"
  precmd () {
    echo # ... then output a new line before every new prompt
    vcs_info
    RPROMPT="${vcs_info_msg_0_}"
  }
}

# Environment variables
export LC_ALL=en_US.UTF-8
export EDITOR="vi"

# Aliases
alias grep='grep --color'

alias irc='tmux \
    new-session -A -s irssi irssi \;
    set -g status off'

# Per-OS configurations
case "$OSTYPE" in
linux*)
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;103:su=30;41:sg=30;46:tw=30,42:ow=30,103"
  alias ls="ls --color=auto"
  ;;
darwin*)
  export LSCOLORS="exfxcxdxbxegedabagacad"
  alias ls="ls -G"
  alias ltop="top -ocpu -R -F -n30"
  alias -g F='"`osascript -e \"tell app \\"Finder\\" to get posix path of (target of window 1 as alias)\"`"'
  if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  rmt () { mv $* ~/.Trash/ }
  ;;
esac

# PATH configuration
if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
if [ -f $HOME/.cargo/env ]; then
  . $HOME/.cargo/env
fi
export PATH=./bin:~/local/bin:~/.local/bin:$PATH

# Use emacs-style key bindings in spite of EDITOR being vim
bindkey -e

# Remote shell options
if [[ "$SSH_CLIENT" != "" ]]
then
  PS1="%F{white}[%f%D{%H}%F{white}:%f%D{%M} %(!.%F{red}.%F{white})%n%f@%F{blue}%m%f:%F{white}%~ %f%!%F{white}]%f %(!.%F{red}.%F{white})%#%f "
  precmd() {
    vcs_info
    RPROMPT="${vcs_info_msg_0_}"
  }
fi

# Zsh variables
HISTFILE=~/.histfile
HISTSIZE=128000
SAVEHIST=128000
REPORTTIME=5 # Print CPU usage statistics if usage is greater than $REPORTTIME seconds

# Zsh modules
autoload -Uz compinit
autoload -Uz vcs_info
compinit -u # The "-u" flag bypasses the compaudit warnings about insecure directories

# Zsh options
unsetopt prompt_cr # This option would add a weird "new line" when entering a command while zsh is loading...
setopt histverify # No automatic validation with bang-history (e.g "!!")
setopt appendhistory # Append the new history to the old instead of just overwriting everything that's in the history file
setopt incappendhistory # Each line is added to the history as it is executed
setopt sharehistory # As each line is added, the history file is checked to see if anything was written out by another shell, and if so it is included in the history of the current shell too
setopt histignorealldups # Removes copies of lines still in the history list, keeping the newly added one
setopt histignorespace # Ignore lines starting by a space
setopt auto_cd # Automatically go into directory w/o having to invoke cd
setopt nonomatch
setopt extendedglob

# Zsh completion
#zstyle ':completion:*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
#zstyle ':completion:*:processes' command 'ps x'
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BDésolé, pas de résultats pour : %d%b'
#zstyle ':completion:*' menu select=2
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Zsh vcs info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%c%u[%b]"
zstyle ':vcs_info:git*' actionformats "%F{red}!%f[%b]"
zstyle ':vcs_info:git*:*' stagedstr "%F{white}•%f"
zstyle ':vcs_info:git*:*' unstagedstr "%F{blue}•%f"
