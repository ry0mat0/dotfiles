# Created by newuser for 5.8
# echo "~/.zshrc is loaded"

HOSTNAME=$(hostname -s)
# if [[ $HOSTNAME == jikken2022-2 ]]; then
if [ `echo $HOSTNAME | grep 'jikken2022'` ]; then
  export http_proxy=http://133.63.21.99:8080
  export https_proxy=$http_proxy
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$http_proxy
  export ALL_PROXY=$http_proxy
fi

autoload -Uz colors
colors

autoload -U compinit
compinit

autoload -Uz vcs_info
setopt prompt_subst
zstyle  ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle  ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle  ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle  ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle  ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }

#Use default prompt list
# autoload -U promptinit
# promptinit
# prompt adam2

#alias
alias ls='ls -GF'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
 alias vi='vim'
alias gls='alias | grep git'
alias g='git'
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gcz='git cz c'
alias cdw1='cd ~/Documents/workspace'

#prompt
# RPROMPT='%n@%m'
# RPROMPT='(%F{green}%~%f)'
PROMPT='(%F{green}%~%f)${vcs_info_msg_0_}(@%m)
>'

#settings depend os OS
if [[ "$(uname)" = Linux ]]; then
  #setting for Ubuntu
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fp() {
    readlink -f $1 | xclip -selction c
  }
  ct() {
    cat $1 | xclip -selection c
  } 
elif [[ "$(uname)" = Darwin ]]; then
  #setting for OSX
  ARCH=$(uname -m)
  if [[ $ARCH == arm64 ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  elif [[ $ARCH == x86_64 ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
  alias ad='terminal-share -service airdrop -video' #use AirDrop
  alias ql='qlmanage -p "$@" >&/dev/null' #use QuickLook
  alias o='open'
  # use pyenv
  eval "$(pyenv init -)"
  fp() {
    readlink -f $1 |pbcopy
  }
fi
