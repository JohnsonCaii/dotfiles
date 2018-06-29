# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"
# ZSH_THEME='powerline'

plugins=(git python brew node npm tmux tmuxinator vi-mode colorize autojump tmuxinator)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR='emacs'

alias grep='grep --color=auto'
alias scala='scala -Dscala.color=True'

# brew
alias bs='brew search'
alias bi='brew install'
alias bl='brew list'

alias bcs='brew cask search'
alias bci='brew cask install'
alias bcl='brew cask list'

# python
alias run_flask='python manage.py runserver'
alias pip_install='pip install -r requirements.txt'

# git
alias gp='git push origin $(git_current_branch)'
alias gl='git pull origin $(git_current_branch)'

# jwt
alias generate_jwt="node $HOME/workspace/company/camelus/jwt_generate.js"

bindkey -e

export PATH="$(brew --prefix openvpn)/sbin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.pyenv/bin:$PATH"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
export HOMEBREW_NO_AUTO_UPDATE=1

