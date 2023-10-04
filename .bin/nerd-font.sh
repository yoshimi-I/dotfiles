#!/bin/zsh

# gitからnerd-fontsをクローン
git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts

# 好きなフォントをインストール
./install.sh 

# 不要になったファイルを削除
cd ..
rm -rf nerd-fonts
