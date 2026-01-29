#!/bin/bash

DOTFILES=~/.dotfiles

echo "creating symlinks"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename "$file" ".symlink" )"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "backing up $target to ${target}.backup"
        mv "$target" "${target}.backup"
    fi
    echo "creating symlink for $file"
    ln -fs "$file" "$target"
done
