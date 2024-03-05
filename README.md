<div align="center">

<samp>

# dotfiles

**Welcome to my personal dotfiles!!**

</samp>

</div>

&emsp;
## Overview

macOSのセットアップ方法

&emsp;




## セットアップ方法

1. このリポジトリをcloneしてください

```shell
$ cd ~ && git clone https://github.com/yoshimi-I/dotfiles
```
2. 全てのfileへの権限付与を行ってください
```shell
$ cd ~/dotfiles && chmod +x ./* && chmod +x ./.bin/* 
```
3. 全shellの実行をmakeで行います

```shell
$ make
```

## 各種アプリケーションの設定

visual studio code

```
1. Visual Studio Codeで「shift + command + P」を押す
2. 「Command: Install 'code' command in PATH command」を検索してクリックする
3. Visual Studio Codeを再起動
4. 「cd dotfiles && sh ./vscode/sync.sh」を実行
5. 現在の拡張機能を出力したい場合は、「code --list-extensions > ~/dotfiles/vscode/extensions」を実行

```
google chrome

```
1. Access each URL in "~/dotfiles/chrome/extensions" with Google Chrome.
2. Click "Add Chrome" button.
```

Raycast
```

1. Rascastアプリを開く
2. RascastでWarpを検索し、下にある「アクション」ボタンをクリックする
3.「アプリケーションを設定する」を選択する
4. hot key を選択する
```

## 古いPCで行うこと
brewのdumpを行う
```
1. ターミナルかで任意のディレクトリに移動
2. brewのdumpをとる
    brew bundle dump --global
```

vscodeの拡張機能のdumpを行う
```
1. 任意のディレクトリに移動
2. 拡張機能のdumpをとる
    code --list-extensions > extensions
```
vscodeの設定を反映させる
```
/Users/username/Library/Application Support/Code/User/settings.json
が該当
```
