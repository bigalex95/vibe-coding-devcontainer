#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"
HOME_DIR="$HOME"

create_symlink() {
    src="$DOTFILES_DIR/$1"
    dest="$HOME_DIR/$1"

    if [ ! -e "$src" ]; then
        echo "Source $src does not exist. Skipping."
        return
    fi

    if [ -L "$dest" ]; then
        current_target=$(readlink "$dest")
        if [ "$current_target" == "$src" ]; then
            echo "$dest is already correctly linked."
            return
        fi
    fi

    if [ -e "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    echo "Linking $src to $dest"
    ln -s "$src" "$dest"
}

create_symlink ".zshrc"
create_symlink ".opencode"
create_symlink ".oh-my-zsh"

echo "Environment setup complete!"
