# dotFiles

A simple way to configure your bash shell as developer [terminal][cli].

## Dotfiles

This is the current list of files:

```
~/.dotfiles
~/.bash_profile
~/.bashrc
~/.gemrc
~/.gitconfig
~/.gitignore
~/.hgignore_global
~/.rspec
~/.smb/smb.conf
~/.vimrc
~/zshrc
```

### Sublime Packages

Run "advance install" command and paste:
```
A File Icon,
Alignment,
Base Encoder,
Better RSpec,
Case Conversion,
ChangeQuotes,
Copy Relative Path,
EML (E-Mail),
Git,
GitGutter,
Handlebars,
Ember Syntax,
JSX,
ReactJS,
Ruby Block Converter,
Sass,
SideBarEnhancements,
Spec Finder,
SublimeLinter,
SublimeLinter-annotations,
SublimeLinter-rubocop,
Toggle Symbol to String,
TrailingSpaces
```

### Atom Packages
```
advanced-new-file
atom-alignment
atom-material-ui
blame
change-case
default-language
dracula-theme
dracula-ui
file-icons
git-diff-details
git-history
highlight-selected
language-haml
linter
linter-ruby
minimap
pane-layout-plus
set-syntax
sort-lines
sync-settings
text-manipulation
todo-show
atom-dark-syntax
atom-dark-ui
atom-light-syntax
atom-light-ui
base16-tomorrow-dark-theme
base16-tomorrow-light-theme
one-dark-ui
one-dark-syntax
one-light-syntax
one-light-ui
solarized-dark-syntax
solarized-light-syntax
about
archive-view
autocomplete-atom-api
autocomplete-css
autocomplete-html
autocomplete-plus
autocomplete-snippets
autoflow
autosave
background-tips
bookmarks
bracket-matcher
command-palette
deprecation-cop
dev-live-reload
encoding-selector
exception-reporting
find-and-replace
fuzzy-finder
git-diff
go-to-line
grammar-selector
image-view
incompatible-packages
keybinding-resolver
line-ending-selector
link
markdown-preview
metrics
notifications
open-on-github
package-generator
release-notes
settings-view
snippets
spell-check
status-bar
styleguide
symbols-view
tabs
timecop
tree-view
update-package-dependencies
welcome
whitespace
wrap-guide
language-c
language-clojure
language-coffee-script
language-csharp
language-css
language-gfm
language-git
language-go
language-html
language-hyperlink
language-java
language-javascript
language-json
language-less
language-make
language-mustache
language-objective-c
language-perl
language-php
language-property-list
language-python
language-ruby
language-ruby-on-rails
language-sass
language-shellscript
language-source
language-sql
language-text
language-todo
language-toml
language-xml
language-yaml
```

### Brew Packages

Run in the terminal:
```
brew install \
autoconf \
autojump \
awscli \
ctags \
curl \
gdbm \
gettext \
git \
htop \
hub \
icu4c \
libidn \
libidn2 \
libunistring \
mysql \
node \
openssl \
pcre \
pkg-config \
python \
rbenv \
rbenv-default-gems \
readline \
ruby-build \
sqlite \
tree \
watchman \
wget \
xz
```

## Requirements

- Mac OSX
- Git ([git-scm.com](http://git-scm.com))
- GitHub account ([github.com](http://github.com))
- System's Ruby (also rake) ([ruby-lang.org](http://www.ruby-lang.org/en/))

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

[cli]: http://en.wikipedia.org/wiki/Command_line_interface
[git]: http://git-scm.com/
[sinatra]: http://www.sinatrarb.com/
[ruby]: http://ruby-lang.org/
[rails]: http://rubyonrails.org/
[rvm]: https://rvm.beginrescueend.com/
[rbenv]: https://github.com/sstephenson/rbenv
[gem]: http://rubygems.org/
[bash]: http://www.gnu.org/software/bash/
