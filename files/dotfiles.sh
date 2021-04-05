#-------------------------------------------------------------------------------
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH";

if which rbenv > /dev/null; then
  # rbenv installed
  export PATH=$(rbenv root)/shims:$(rbenv root)/bin:$PATH;
  eval "$(rbenv init -)";
fi

#-------------------------------------------------------------------------------
# Homebrew should be before system-provided path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#-------------------------------------------------------------------------------
# This fix MySQL: Library not loaded: libmysqlclient.18.dylib (LoadError)
# But WARNING, setting DYLD_LIBRARY_PATH can break dynamic linking.
# export export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

#-------------------------------------------------------------------------------
# Default editor
if [ `which sublime` ]; then
  export EDITOR="sublime -a"
elif [ `which atom` ]; then
  export EDITOR="atom"
fi

#-------------------------------------------------------------------------------
# Default git editor
export GIT_EDITOR="$EDITOR --wait"

#-------------------------------------------------------------------------------
# Locale (Prefer US English and use UTF-8)
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

#-------------------------------------------------------------------------------
# NodeJs and CoffeeScript
# http://c.kat.pe/how-to-install-coffeescript-on-mac-os-x
export PATH="/usr/local/share/npm/bin:$PATH";
export NODE_PATH="/usr/local/lib/node";

#-------------------------------------------------------------------------------
# Aliases
alias work='clear; cd <%= @projects_dir %>;'

alias claer='clear;' # Nada puede malir sal
alias cls='clear; ls;'
alias create='touch'
alias exot='exit'
alias find_text='grep -Rin --color'
alias find_usages='grep -ien --color'
alias l='ls -CF'
alias ls='ls -G'
alias la='ls -A'
alias ll='ls -alF'
alias reload='source ~/.bash_profile'

# Text Editors
alias st='stree .';
alias s='sublime -a .';
alias a='atom -a .';

# Ruby & Bundler
alias be='bundle exec'
alias bi='bundle check || bundle install --local'
alias bu='bundle update'

# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias repush='git commit --amend --no-edit; git push --force;'

# Open GitKraken using the current repo directory in the cli and bring it on focus.
alias kraken='open gitkraken://repo/$PWD'

alias github='gh'

# vim
alias vi='vim'

# OSX
alias show_hidden_files_mac='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide_hidden_files_mac='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
