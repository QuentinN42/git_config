#!/bin/bash


function move_file() {
    # move the file to .local/etc/git_config

    mkdir -p "$HOME/.local/etc/git_config" || exit 1;
    cp ./git_config.sh "$HOME/.local/etc/git_config/git_config.sh" || exit 2;
}

function make_config_folder() {
    mkdir -p "$HOME/.config/git_config" || exit 3;
}


function zsh_source() {
    # add source git_config into zshrc

    echo "source \"$HOME/.local/etc/git_config/git_config.sh\"" >> "$HOME/.zshrc";
}

function zsh_source_if_exist() {
    # add source git_config into zshrc

    test -f "$HOME/.zshrc" && zsh_source;
}



function bash_source() {
    # add source git_config into zshrc

    echo "source \"$HOME/.local/etc/git_config/git_config.sh\"" >> "$HOME/.zshrc";
}

function bash_source_if_exist() {
    # add source git_config into zshrc

    test -f "$HOME/.zshrc" && bash_source;
}


function install() {
    make_config_folder;
    move_file;
    zsh_source_if_exist;
    bash_source_if_exist;
}

install;
