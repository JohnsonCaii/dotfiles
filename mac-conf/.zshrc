# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

DISABLE_UPDATE_PROMPT=true

plugins=(git pyenv python docker brew node npm tmux tmuxinator vi-mode colorize autojump tmuxinator redis-cli spring yarn)

export PATH="/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/llvm/bin:/usr/local/opt/gettext/bin:/usr/local/opt/llvm@4/bin:$(brew --prefix openvpn)/sbin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.pyenv/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_GITHUB_API_TOKEN='0003110a442cf9f6fe1bf51e6cc6aac13996ce37'
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR='vim'

alias grep='grep --color=auto'
alias scala='scala -Dscala.color=True'

alias speed="speedtest-cli"

# brew
alias bs='brew search'
alias bi='brew install'
alias bl='brew list'
alias bu='brew update'

alias bcs='brew cask search'
alias bci='brew cask install'
alias bcl='brew cask list'

# alias git='LANG=en_US git'

# python
alias run_flask='python manage.py runserver'
alias pip_install='pip install -r requirements.txt'

# git
alias gp='git push origin $(git_current_branch)'
alias gl='git pull origin $(git_current_branch)'
alias gsu='git submodule update'

# docker
alias dp='docker ps'
alias dlf='docker logs -f'
alias ds='docker stats'
alias dpa='docker ps -a'
alias cleos='docker exec -it eosio /opt/eosio/bin/cleos -u http://0.0.0.0:8888 --wallet-url http://0.0.0.0:8888'

# jwt
alias generate_jwt="node $HOME/workspace/company/camelus/jwt_generate.js"

bindkey -e

export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
