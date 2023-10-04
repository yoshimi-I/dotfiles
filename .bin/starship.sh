#!/bin/zsh

echo "Install "

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)" #/bin

echo "Create a symbolic starship setting..."
STARSHIP_CONFIG_DIR="$(dirname "$CURRENT_DIR")/starship"

ln -fnsv "${STARSHIP_CONFIG_DIR}/starship.toml" "$HOME/.config"

source ~/.zshrc
