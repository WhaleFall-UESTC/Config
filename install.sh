#!/bin/bash

files=(".zshrc" ".tmux.conf" ".vimrc") 
dst="$HOME/.src"
repo="git@github.com:WhaleFall-UESTC/Config.git"

copy_file() {
    local src="$1" 
    local dest="$dst/$src" 

    if [ ! -f "$src" ]; then
	echo "file $src does not exists"
        return 1 
    fi

    if cp "$src" "$dest" 2>/dev/null; then
        return 0
    else
	echo "failed to cpoy $src to $dest"
        return 1  
    fi
}


if git rev-parse --is-inside-work-tree > /dev/null 2>&1 && git remote -v | grep "$repo" > /dev/null 2>&1; then
    pwd="$(pwd)"
    if [ "$pwd" != "$dst" ]; then
        echo "not in $dst"
        rm -rf "$dst"
        mkdir -p "$dst"

        cp -R $pwd/. $dst

        if [ "$1" == "d" ]; then
            if [ "$(ls -A $dst)" ]; then
                cd "$dst"
                rm -rf "$pwd"
            else
                echo "copy failed"
            fi
        fi
    fi

    cd "$dst"

    # echo "Create symlinks"
    for file in "${files[@]}"; do
        if [ ! -L "$HOME/$file" ]; then
            ln -s "$file" "$HOME/$file"
            echo "create symlink:"
            ls -l "$HOME/$file"
        else
            echo "symlink $file exists"
        fi
    done
    echo "Done"
else
    echo "install.sh not in the repo"
fi
