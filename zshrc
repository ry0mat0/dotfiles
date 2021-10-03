# Created by newuser for 5.8
echo "~/.zshrc is loaded"

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
alias ll='ls -la'
alias la='ls -a'
alias vi='nvim'
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
PROMPT='(%F{green}%~%f)${vcs_info_msg_0_}
>'

#setting for OSX
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ad='terminal-share -service airdrop -video' #use AirDrop
alias ql='qlmanage -p "$@" >&/dev/null' #use QuickLook

#use python installed by pyenv
#export PYENV_ROOT="/usr/local/var/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -path)"
eval "$(pyenv init -)"
