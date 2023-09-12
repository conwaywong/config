# WSL2 Initialization Guide

## Install required packages

```shell
sudo apt update && sudo apt upgrade -y && \
sudo apt install -y \
bat \
meld \
podman \
silversearcher-ag \
vim \
zsh
```

## Configure zsh

Follow the [installation instructions](https://github.com/sorin-ionescu/prezto#installation).

Open `.zprestorc` and change the theme to p10k.

## Configure vim

Install vim-plugged.

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Copy vim configuration from this repo to the $HOME directory

```shell
cp .vimrc $HOME/.vimrc
```

Open vim, and execute `:PlugInstall`.

```shell
:PlugInstall
```
