echo "Set up hammerspoon"

# WezTermの設定ディレクトリが存在しない場合は作成
mkdir -p ~/.hammerspoon

# 既存のシンボリックリンクがある場合は削除
[ -L ~/.hammerspoon/init.lua ] && rm ~/.hammerspoon/init.lua

# シンボリックリンクを作成
ln -s ~/dotfiles/.config/hammerspoon/init.lua ~/.hammerspoon/init.lua
