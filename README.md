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
git \
jq \
libxml2-utils \
meld \
npm \
podman \
ripgrep \
tidy \
tmux \
vim \
zsh
```

## Set zsh as default shell

```shell
chsh -s $(which zsh)`
```

Log out and back in.

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

## Install NodeJS

```shell
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  \
  sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y
```

### Allow global install without sudo

```shell
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"
```

Add the following to `~/.zshrc` (if it isn't already there)

```shell
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
```

## Install secondary packages

### markdownlint

Used for vim ALE plugin as a Markdown linter

```shell
npm install -g markdownlint-cli
```

Create a new .md linter config or copy the provided one.

```shell
cp dev/.markdownlint.yaml ~/.markdownlint.yaml
```

### Prettier

```shell
npm install -g --save-dev --save-exact prettier
node --eval "fs.writeFileSync('.prettierrc','{}\n')"
```
