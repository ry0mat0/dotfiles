# Created by newuser for 5.8
# echo "~/.zshrc is loaded"

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
# alias ls='ls -GF'
alias ls='ls --color=auto'  
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
alias vi='vim'
alias gls='alias | grep git'
alias g='git'
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gp='git push'
alias gcz='git cz c'
alias cd='z'

#prompt
# RPROMPT='%n@%m'
# RPROMPT='(%F{green}%~%f)'
PROMPT='(%F{green}%~%f)${vcs_info_msg_0_}(@%m)
>'

DIRSTACKSIZE=100
setopt AUTO_PUSHD
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
# zstyle ':completion:*:default' menu select=1


#settings depend os OS
if [[ "$(uname)" = Linux ]]; then
  #setting for Ubuntu
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  export PATH="$HOME/.local/bin:$PATH"
  fp() {
    readlink -f $1 | xclip -selection c
  }
  ct() {
    cat $1 | xclip -selection c
  }
elif [[ "$(uname)" = Darwin ]]; then
  #setting for OSX
  ARCH=$(uname -m)
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  alias ad='terminal-share -service airdrop -video' #use AirDrop
  alias ql='qlmanage -p "$@" >&/dev/null' #use QuickLook
  alias o='open'
  # alias vi='/usr/local/bin/vim'
  fp() {
        readlink -f $1 |pbcopy
  }
  fl() {
       fullpath=$(readlink -f $1)
       echo "[$1](file://${fullpath})" | pbcopy
  }
  ct() {
    cat $1 | pbcopy
  }
fi

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# use zoxide
eval "$(zoxide init zsh)"

#load local zsh configuration
source ~/.local.zsh
