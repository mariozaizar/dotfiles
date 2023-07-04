# dotFiles

A simple way to configure your developer machine.

## How it works

This script will create/replace these files:

```sh
~/.dotfiles
~/.bash_profile
~/.bashrc
~/.gemrc
~/.gitconfig
~/.gitignore
~/.vimrc
~/.zshrc
~/.zprofile
```

*Note:* this will generate the files (for example `~/.gitconfig`) and then it will copy this files inside your home directory (making backups if necessary). So, that means that we will REPLACE the original files, but creating a backup with `*.old` extension. Please go to 'Uninstall" section to see how to recover your original files.

## Requirements

- Mac OS Ventura
- GitHub account
- Homebrew: https://brew.sh/
- Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh

## Setup

### Cloning

```sh
git clone https://github.com/mariozaizar/dotfiles.git;
cd dotfiles/;
rake help;
```

### Install

```sh
rake install
```

### Uninstall

```sh
rake uninstall
```

### Extras

Run in the terminal:

```sh
brew install \
  autoconf \
  autoconf \
  automake \
  curl \
  gh \
  git \
  htop \
  node \
  openssl \
  rbenv \
  ruby-build \
  tree \
  wget \
  zstd \
  jq
```

To be reviewed:

```sh
brew install \
  autojump \
  awscli \
  ctags \
  gdbm \
  gettext \
  icu4c \
  libidn \
  libidn2 \
  libunistring \
  mysql \
  pcre \
  pkg-config \
  readline \
  sqlite \
  watchman \
  xz
```
