# Powershell設定

## フォントをインストール

latest releaseの[NerdFonts](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file)をインストールする。

- ファイル名：HackNerdFontPropo-Bold

## powershellをインストール

Microsoft storeでpowershellをインストールする。
既定のプロファイルにpowershellを設定する。

## powershellの設定を変更

settings.jsonの内容をコピーして貼り付け。


## scoopをインストール

```sh
iwr -useb get.scoop.sh | iex
scoop install curl sudo jq
```

## gitをインストール

```sh
winget install -e --id Git.Git
```

## neovimをインストール

```sh
scoop install neovim gcc
```

## プロンプトのプロファイル作成

ルートディレクトリで以下を実施

```sh
mkdir .config/powershell
nvim .config/powershell/user_profile.ps1
nvim $PROFILE.CurrentUserCurrentHost
```
:::note warn
$PROFILE.CurrentUserCurrentHostはパスを調べてディレクトリを作成しないとエラーになるかも
:::

- .config/powershell/user_profile.ps1

```
# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
```

- $PROFILE.CurrentUserCurrentHost

```
. $env:USERPROFILE/.config/powershell/user_profile.ps1
```

## OhMyPoshをインストール

```sh
Install-Module posh-git -Scope CurrentUser -Force
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

## Themeを編集

.config\powershell配下にmytheme.omp.jsonを配置
.config/powershell/user_profile.ps1に以下を追加


```
# Prompt
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\powershell\mytheme.omp.json" | Invoke-Expression
```


---

# lazyvimセットアップ

## ディレクトリ構成作成

```sh
cd ~
mkdir -p ~/.config/nvim
cd ~/.config/nvim
new-item init.lua
mkdir -p lua/yababa/core
mkdir -p lua/yababa/plugins
new-item lua/yababa/lazy.lua
```

# wslの設定

## install

```
sudo apt update
sudo apt install neovim build-essential fzf git unzip
```

## zsh setup

```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## dotfiles setup

```
cd
git clone https://github.com/yabasaba/dotfiles.git
chmod +x ~/dotfiles/install.sh
source ~/dotfiles/install.sh
```

restart terminal

