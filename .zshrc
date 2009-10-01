case `uname` in
Linux)
  export EDITOR='vi'
  alias ls='ls --color=auto'
  ;;
Darwin)
  PATH=$PATH:/usr/local/avr/bin:/opt/local/bin
  MANPATH=$MANPATH:/opt/local/share/man
  INFOPATH=$INFOPATH:/opt/local/share/info
  export EDITOR='mate -w'
  alias ls='ls -G'
  alias ltop='top -ocpu -R -F -n30'
  srm () { mv $* ~/.Trash/ }
;;
esac

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=128000
SAVEHIST=128000

setopt histverify # No automatic validation with bang-history (e.g "!!")

setopt appendhistory # Append the new history to the old instead of just overwriting everything that's in the history file
setopt incappendhistory # Each line is added to the history as it is executed
setopt sharehistory # As each line is added, the history file is checked to see if anything was written out by another shell, and if so it is included in the history of the current shell too
setopt histignorealldups # Removes copies of lines still in the history list, keeping the newly added one
setopt histignorespace # Ignore lines starting by a space

autoload -Uz compinit
compinit

zmodload zsh/complist
setopt correctall
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BDésolé, pas de résultats pour : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

LSCOLORS="gxfxcxdxbxegedabagacad"

alias cleandir='rm -v *~ .*~ \#*\# 2>/dev/null'
alias grep='grep --color'

autoload -U colors
colors

export MAIN_COLOR="%{$reset_color%}"
export ALT_COLOR="%{$fg[white]%}"

#if test `whoami` != “root”
if [[ "$UID" == "0" ]]
then
export CONT_COLOR="%{$fg[red]%}"
else
export CONT_COLOR="%{$fg[white]%}"
fi

#RPROMPT="%~"
PS1="${ALT_COLOR}[${MAIN_COLOR}%D{%H}${ALT_COLOR}:${MAIN_COLOR}%D{%M} ${CONT_COLOR}%n${MAIN_COLOR}@${ALT_COLOR}%m${MAIN_COLOR}:${ALT_COLOR}%~ ${MAIN_COLOR}%!${ALT_COLOR}]${MAIN_COLOR} ${CONT_COLOR}%#${MAIN_COLOR} "
unset MAIN_COLOR
unset ALT_COLOR
unset CONT_COLOR
