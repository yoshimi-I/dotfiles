#!/bin/zsh
if ! command -v goenv &> /dev/null; then
    echo "goenv, installing now..."
    git clone https://github.com/syndbg/goenv.git ~/.goenv
    source ~/.zshrc
else
    echo "goenv is already installed"
fi
