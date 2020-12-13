#!/bin/bash

export GIT_CONFIG_FOLDER="$HOME/.config/git_config"

function git_config()
{
    if (( $# != 1 ));
    then
        echo "One parameter required: config file name" >&2;
    else
        file="$GIT_CONFIG_FOLDER/$1";
        if test -f "$file";
        then
            git config -f "$file" -l | cat | while IFS= read -r to_add;
            do
                git config "$(echo "$to_add" | cut -d= -f1)" "$(echo "$to_add" | cut -d= -f2)";
            done;
            echo "Git config updated according to '$file' !";
        else
            echo "File '$file' not found" >&2;
        fi
    fi
}


function _git_config_completion() {
    COMPREPLY=( $(ls "$GIT_CONFIG_FOLDER" | xargs) );
    return 0;
}


complete -F _git_config_completion git_config