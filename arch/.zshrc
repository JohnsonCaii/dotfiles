# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/johnson/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

export EDITOR='emacs'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias Ei3="vim $HOME/.config/i3/config"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
neofetch
source /usr/share/nvm/init-nvm.sh
