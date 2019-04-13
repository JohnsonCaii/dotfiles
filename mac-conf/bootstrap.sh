#!/bin/bash

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

install_brew() {
    info 'install brew!'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_brew_apps() {
    info 'install brew apps!'
    readonly brew_apps=(
        yarn
        autoconf
        automake
        git
        gradle
        htop
        maven
        nload
        node
        pyenv
        pyenv-virtualenv
        python@2
        readline
        reattach-to-user-namespace
        tmux
        zsh
        zsh-syntax-highlighting
        tig
        autojump
        nvm
        tree
        watch
        wget
    )

    readonly brew_cask_apps=(
        youtube-dl
        macdown
        1password
        sogouinput
        wechat
        baidunetdisk
        microsoft-office
        the-unarchiver
        betterzip
        thunder
        shadowsocksx-ng
        charles
        postico
        datagrip
        webstorm
        pycharm
        intellij-idea
        mounty
        firefox
        gas-mask
        alfred
        aliwangwang
        amethyst
        bartender
        docker
        emacs
        google-chrome
        iterm2
        java8
        neteasemusic
        postman
        qq
        spectacle
        snip
        telegram
        tunnelblick
        youdaodict
    )

    for i in ${brew_cask_apps[@]}; do
        echo ""
        echo "<brew cask> => installing $i"
        brew cask install $i
    done

    for i in ${brew_apps[@]}; do
        echo ""
        echo "<brew> => installing $i"
        brew install $i
    done


}

setup_spacemacs() {
    info 'install spacemacs!'
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    echo "(setq mac-option-modifier 'super)" >> $HOME/.emacs.d/init.el
    echo "(setq mac-command-modifier 'meta)" >> $HOME/.emacs.d/init.el
}

setup_vim() {
    ln -s $HOME/dotfiles/mac-conf/.vimrc $HOME/.vimrc
}

setup_gitconfig () {
    info 'setup git config!'
    ln -s $HOME/dotfiles/mac-conf/.gitconfig $HOME/.gitconfig
    ln -s $HOME/dotfiles/mac-conf/.gitignore $HOME/.gitignore
    ln -s $HOME/dotfiles/mac-conf/.gitignore_global $HOME/.gitignore_global
}

setup_tmux() {
    info 'setup tmux!'
    ln -s $HOME/dotfiles/mac-conf/.tmux.conf $HOME/.tmux.conf
    ln -s $HOME/dotfiles/mac-conf/.tmuxinator $HOME/.tmuxinator
}

setup_zsh() {
    info 'setup zsh!'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -s $HOME/dotfiles/mac-conf/.zshrc $HOME/.zshrc
}

install_brew
install_brew_apps
setup_spacemacs
setup_tmux
setup_gitconfig
setup_vim
setup_zsh

