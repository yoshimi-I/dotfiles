#!/bin/zsh

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [ "$(uname -m)" = "arm64" ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null
fi

# Install xcode
xcode-select --install

# Install Rosetta 2 for Apple Silicon
if [ "$(uname -m)" = "arm64" ] ; then
  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi
