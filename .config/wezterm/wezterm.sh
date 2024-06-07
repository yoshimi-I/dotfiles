#!/bin/sh

# 変数定義
TARGET_DIR="$HOME/.config/wezterm"
SOURCE_FILE="$(pwd)/.config/wezterm/wezterm.lua"
LINK_NAME="$TARGET_DIR/wezterm.lua"

# ディレクトリが存在するか確認し、存在しない場合は作成
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi

# シンボリックリンクが既に存在する場合は削除
if [ -L "$LINK_NAME" ]; then
  rm "$LINK_NAME"
fi

# シンボリックリンクを作成
ln -s "$SOURCE_FILE" "$LINK_NAME"
