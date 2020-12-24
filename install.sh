#!/bin/bash

function move_file() {
  # move the file to .local/etc/git_config
  mkdir -p "$HOME/.local/etc/git_config" || exit 1;
  cp ./git_config.sh "$HOME/.local/etc/git_config/git_config.sh" || exit 2;
}

function make_config_folder() {
  mkdir -p "$HOME/.config/git_config" || exit 3;
}

function add_source() {
  # source git_config into $1 if file exist and not already set
  local line='[[ ! -f "${HOME}/.local/etc/git_config/git_config.sh" ]] || source "${HOME}/.local/etc/git_config/git_config.sh";';
  test -f "$1" && $(grep -q "$line" $1 || echo "$line" >> $1);
}

function install() {
    make_config_folder;
    move_file;
    add_source ~/.bashrc;
    add_source ~/.zshrc;
}

install;
