export ZSH=/home/johnson/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git dotenv nmap history tmux virtualenv archlinux
)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# source /etc/profile.d/autojump.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export GOPATH="$HOME/go"
export PATH="$HOME/.yarn/bin:$PATH:$(pyenv root)/shims:/usr/local/bin:/usr/bin:/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

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
    export http_proxy=http://192.168.2.162:8889
    export https_proxy=http://192.168.2.162:8889
}


