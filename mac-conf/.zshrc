# Path to your oh-my-zsh installation.
export ZSH=/Users/zhpooer/.oh-my-zsh

ZSH_THEME="gentoo"
# ZSH_THEME='powerline'

plugins=(git python brew node npm tmux tmuxinator vi-mode colorize autojump)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='/usr/local/Caskroom/emacs/24.5-1/Emacs.app/Contents/MacOS/bin/emacsclient -t'
fi

alias vi="vim"
alias ll='ls -al'
alias grep='grep --color=auto'
alias tm="tmux attach"
alias scala='scala -Dscala.color=True'

# python
alias run_flask='python manage.py runserver'
alias pip_install='pip install -r requirements.txt'

alias generate_jwt='node /Users/zhpooer/ce-workspace/company/camelus/jwt_generate.js'

bindkey -e

export PATH="$(brew --prefix openvpn)/sbin:/usr/local/sbin:$HOME/.yarn/bin:$HOME/.pyenv/bin:$PATH"

source /Users/zhpooer/ce-workspace/programming/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
