#!/bin/zsh

echo "Set up WezTerm"

# WezTermの設定ディレクトリが存在しない場合は作成
mkdir -p ~/.config/wezterm

# 既存のシンボリックリンクがある場合は削除
[ -L ~/.config/wezterm/wezterm.lua ] && rm ~/.config/wezterm/wezterm.lua


# シンボリックリンクを作成
ln -s ~/dotfiles/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
