#!/bin/bash

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
)

readonly brew_cask_apps=(
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
    telegram-desktop
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


