<div align="center">

<samp>

# dotfiles

**Welcome to my personal dotfiles!!**

</samp>

</div>

&emsp;
## Overview

This repository contains scripts to set macOS.

&emsp;




## Install

Download installation materials.

```shell
$ cd ~ && git clone https://github.com/yoshimi-I/dotfiles
```
Authorization all shell files
```shell
$ cd ~/dotfiles && chmod +x ./* && chmod +x ./.bin/* 
```
Set macOS.

```shell
$ make
```

Set visual studio code.

```
1. Press "shift + command + P" on visual studio code.
2. Search and Click "Command: Install 'code' command in PATH command".
3. Restart visual studio code.
4. Execute "cd dotfiles && sh ./vscode/sync.sh".
5. If you want to output the current extensions, execute "code --list-extensions > ~/dotfiles/vscode/extensions".
```

Set google chrome.

```
1. Access each URL in "~/dotfiles/chrome/extensions" with Google Chrome.
2. Click "Add Chrome" button.
```

Set Raycast
```
1. Open Rascast App
2. Search Warp on Rascast and  click the button labeled "Action" below.
3. Choose Configure Application
4. Choice Hotkey
```

How to edit ./zshrc
```sh
open -a TextEdit ~/.zshrc
```
