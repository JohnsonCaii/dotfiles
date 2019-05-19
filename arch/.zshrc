export ZSH=/home/johnson/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git autojump dotenv nmap history tmux
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

export EDITOR='vim'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source /usr/share/nvm/init-nvm.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias dp='docker ps'
alias dpa='docker ps -a'
alias ds='docker stats'


export GOPATH="$HOME/go"

myip () {
    curl myip.ipip.net
}

iplocation () {
    curl --noproxy "*" cip.cc/$1
}

disable-proxy () {
    unset http_proxy
    unset https_proxy
}

enable-proxy () {
    export http_proxy=http://127.0.0.1:1087
    export https_proxy=http://127.0.0.1:1087
}

enable-proxy

# neofetch


