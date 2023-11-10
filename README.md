# WSL2 Initialization Guide

## Prerequisites

- Windows with a Nerdfont configured for the terminal
    - [Consolas NF](https://github.com/wclr/my-nerd-fonts/tree/master/Consolas%20NF)

## Install required packages

```shell
sudo apt update && sudo apt upgrade -y && \
sudo apt install -y \
bat \
fd-find \
meld \
podman \
ripgrep \
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
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && mkdir .vim/swap .vim/backup
```

Copy configuration files from this repo to the $HOME directory

```shell
cp .vimrc $HOME  && cp zsh/.zsh_aliases $HOME
```

Open vim, and execute `:PlugInstall`.

```shell
:PlugInstall
```
