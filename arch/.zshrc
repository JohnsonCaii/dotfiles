# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/johnson/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git autojump dotenv nmap history tmux
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

export EDITOR='vim'

alias Ei3="vim $HOME/.config/i3/config"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /etc/profile.d/autojump.zsh
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

export GOPATH="$HOME/.go"


neofetch
