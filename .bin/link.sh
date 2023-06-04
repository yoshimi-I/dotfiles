#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)" #/bin


echo "Create a symbolic link for dotfiles..."
for dotfile in "${SCRIPT_DIR}"/.??* ; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

echo "Create a symbolic starship setting..."
STARSHIP_CONFIG_DIR="$(cd "$(SCRIPT_DIR)" && pwd)"/starship"

ln -fnsv "${STARSHIP_CONFIG_DIR}/starship.toml" "$HOME/.config"

source ~/.zshrc
