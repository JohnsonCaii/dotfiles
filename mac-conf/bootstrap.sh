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
        autoconf
        automake
        cmake
        gdbm
        git
        gradle
        htop
        icu4c
        libevent
        libtool
        maven
        ninja
        nload
        node
        openssl
        pkg-config
        protobuf
        pyenv
        pyenv-virtualenv
        python@2
        readline
        reattach-to-user-namespace
        sqlite
        tmux
        zsh
        zsh-syntax-highlighting
        tig
        autojump
        nvm
        tree
        yarn
        watch
    )

    readonly brew_cask_apps=(
        datagrip
        webstorm
        pycharm
        intellij-idea
        mounty
        firefox
        gas-mask
        1password
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

    for i in ${brew_apps[@]}; do
        echo "<brew> => installing $i"
        brew install $i
    done

    for i in ${brew_cask_apps[@]}; do
        echo "<brew cask> => installing $i"
        brew cask install $i
    done
}

setup_spacemacs() {
    info 'install spacemacs!'
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    echo "(setq mac-option-modifier 'super)" >> $HOME/.emacs.d/init.el
    echo "(setq mac-command-modifier 'meta)" >> $HOME/.emacs.d/init.el
}

setup_vim() {
    info 'install vim!'
    curl https://j.mp/spf13-vim3 -L > $HOME/spf13-vim.sh
    sh $HOME/spf13-vim.sh
    rm $HOME/spf13-vim.sh
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
setup_zsh
setup_tmux
setup_gitconfig
setup_vim
