#!/bin/zsh

if command -v brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
