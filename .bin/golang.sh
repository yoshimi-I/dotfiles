#!/bin/zsh
if ! command -v goenv &> /dev/null; then
    echo "goenv, installing now..."
    git clone https://github.com/syndbg/goenv.git ~/.goenv
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshrc
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(goenv init -)"' >> ~/.zshrc
    source ~/.zshrc
else
    echo "goenv is already installed"
fi
