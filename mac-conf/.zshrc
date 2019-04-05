export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

DISABLE_UPDATE_PROMPT=true

plugins=(git pyenv python docker brew tmux tmuxinator colorize autojump redis-cli supervisor dotenv)

export PATH="/$(pyenv root)/shims:/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/llvm/bin:/usr/local/opt/gettext/bin:/usr/local/opt/llvm@4/bin:$(brew --prefix openvpn)/sbin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.pyenv/bin:$PATH:$GOPATH/bin"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_GITHUB_API_TOKEN='0003110a442cf9f6fe1bf51e6cc6aac13996ce37'
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


alias grep='grep --color=auto'
alias scala='scala -Dscala.color=True'

alias speed="speedtest-cli"

alias cat="bat"

alias preview="fzf --preview 'bat --color \"always\" {}'"

# brew
alias bs='brew search'
alias bi='brew install'
alias bui='brew uninstall'
alias bl='brew list'
alias bu='brew update'

alias bcs='brew cask search'
alias bci='brew cask install'
alias bcl='brew cask list'

# python
alias run_flask='python manage.py runserver'
alias pip_install='pip install -r requirements.txt'

# git
alias gp='git push origin $(git_current_branch)'
alias gl='git pull origin $(git_current_branch)'
alias gsu='git submodule update'
alias gs='git stash'
alias gsp='git stash pop'

# docker
alias dp='docker ps'
alias dlf='docker logs -f --tail 10'
alias ds='docker stats'
alias dpa='docker ps -a'

export ANSIBLE_INVENTORY="${HOME}/.ansible/hosts"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# archey
