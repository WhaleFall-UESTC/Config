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
    # if git fetch origin > /dev/null 2>&1; then
        # git fetch origin
        if "$(pwd)" != "$dst"; then
            rm -rf "$dst"
            mkdir -p "$dst"

            all_files="$(ls -A)"
            for f in "${all_files[@]}"; do
                if [ -d "$f" ]; then
                    cp -r "$f" "$dst"
                else
                    cp "$f" "$dst"
                fi
            done
        fi

        cd "$dst"

        echo "Create symlinks"
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
        
        # for file in "${files[@]}"; do
        #     ls -l "$HOME/$file"
        # done
    # else
    #     echo "git fetch error"
    # fi
else
    echo "install.sh not in the repo"
fi
