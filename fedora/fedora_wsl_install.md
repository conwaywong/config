# Fedora WSL Install

## Install OS

Download and extract tar.xz file from https://kojipkgs.fedoraproject.org/packages/Fedora-Container-Base/

```shell
wsl --import <Distribution Name> <Install dir> <tar file>
```

## Set up distro

Open new distribution

```shell
wsl --distribution <Distribution Name>
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

## Set up repos

```shell
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
dnf distro-sync
```

### Enable optional repos

```shell
sudo dnf config-manager --set-enabled powertools
sudo dnf install epel-release
sudo dnf install dnf-plugins-core

sudo dnf makecache --refresh
```

### Install necessary packages

```shell
sudo dnf install fd-find git jq npm meld bpytop ripgrep tidy tmux util-linux-user vim zsh -y
```
