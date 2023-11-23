# Rocky Linux WSL Install

## Install OS

Download base image from https://docs.rockylinux.org/guides/interoperability/import_rocky_to_wsl/

```shell
wsl --import <Distribution Name> <Install dir> <tar.xz file>
```

## Set up distro

Open new distribution

```shell
wsl --distribution <Distribution Name>
```

Install minimum packages

```shell
dnf install -y sudo systemd git man-pages man-db man vim
```

Add `conway` user and add to sudo group.

```shell
user=conway
useradd $user
passwd $user
gpasswd -a $user wheel
```

## Create initial wsl.conf

Set default user by creating `/etc/wsl.conf` and setting contents to

```
[interop]
appendWindowsPath = false

[boot]
systemd=true

[user]
default=conway
```

Restart distribution from Windows shell.

```shell
wsl -t <Distribution Name>
```

Create SSH key

```shell
ssh-keygen -t ed25519 -C "$(whoami)-$HOSTNAME-<distro>"
```

## Set up repos

### Enable EPEL repo

```shell
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --set-enabled crb
sudo dnf install epel-release
sudo dnf makecache --refresh
```

## Install necessary packages

```shell
sudo dnf install -y fd-find git jq npm meld ripgrep tidy tmux util-linux-user vim which zsh 
```
