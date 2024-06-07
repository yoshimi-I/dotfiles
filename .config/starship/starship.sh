#!/bin/zsh

echo "Set up Starship "
cp ~/dotfiles/.config/starship/starship.toml ~/.config

# 既存のシンボリックリンクがルバある場合は削除
[ -L ~/.config/starship.toml ] && rm ~/.config/starship.toml

# シンボリックリンクを作成
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# starshipの設定を読み込む
source ~/.zshrc
