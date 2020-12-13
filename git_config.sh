#!/bin/bash

function git_config()
{
    if (( $# != 1 ));
    then
        echo "One parameter required: config file name" >&2;
    else
        file="$HOME/.config/git_config/$1";
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
