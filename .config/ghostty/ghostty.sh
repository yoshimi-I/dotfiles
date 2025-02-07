echo "Set up ghostty"

# WezTermの設定ディレクトリが存在しない場合は作成
mkdir -p ~/.config/ghostty

# 既存のシンボリックリンクがある場合は削除
[ -L ~/.config/ghostty/config ] && rm ~/.config/ghostty/config

# シンボリックリンクを作成
ln -s ~/dotfiles/.config/ghostty/config ~/.config/ghostty/config
