# dotFiles

A simple way to configure your developer machine.

## Files

This is the current list of files:

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

### Brew Packages

Run in the terminal:

```sh
brew install \
curl \
git \
htop \
hub \
node \
openssl \
rbenv \
ruby-build \
tree \
wget
```

To be reviewed:
```sh
brew install \
autoconf \
autojump \
awscli \
ctags \
gdbm \
gettext \
gh \
icu4c \
libidn \
libidn2 \
libunistring \
mysql \
pcre \
pkg-config \
python \
readline \
sqlite \
watchman \
xz
```

## Requirements

- Mac OS Ventura
- GitHub account
- Homebrew

## Installation

### Get it!

```sh
git clone https://github.com/mariozaizar/dotfiles.git;
cd dotfiles/;
rake help;
```

### Install it!

*Note:* this will generate the files (for example `~/.gitconfig`) and then it
will copy this files inside your home directory (making backups if necessary).
So, that means that we will REPLACE the original files, but creating a backup
with `*.old` extension. Please go to 'Uninstall" section to see how to recover
your original files.

```sh
rake install
```

### Uninstall

```sh
rake uninstall
```
