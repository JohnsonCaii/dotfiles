# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
alias bsi='brew cask install'
alias bcl='brew cask list'

# python
alias run_flask='python manage.py runserver'
alias pip_install='pip install -r requirements.txt'

# jwt
alias generate_jwt='node /Users/zhpooer/ce-workspace/company/camelus/jwt_generate.js'

bindkey -e

export PATH="$(brew --prefix openvpn)/sbin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.pyenv/bin:$PATH"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
