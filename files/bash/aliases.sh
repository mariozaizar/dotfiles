# Utils
###############################################################################
alias code='clear; cd <%= @projects_dir %>;'
###############################################################################

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
alias st='stree .';  # SourceTree
alias s='subl -a .'; # Sublime
alias a='atom -a .'; # Atom

# Default Editor
export EDITOR="sublime"; # ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# Ruby & Bundler
alias be='bundle exec'
alias bi='bundle check || bundle install --local'
alias bu='bundle update'

alias cuke="be cucumber -rfeatures -fprogress"
alias pow_log='tail -f ~/Library/Logs/Pow/access.log'
alias pow_restart='echo "Restarting pow..."; touch tmp/restart.txt'

# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'

# vim
alias vi='vim'

# Rails
alias r='rails'
alias rails_log='tail -f ./log/development.log | grep --invert-match DEBUG'
alias rails_test_log='tail -f ./log/test.log | grep --invert-match DEBUG'

# OSX
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

alias zdstart="zdi vm start; zdi services restart; zdi apps restart"

# Rails 2 & 3 functions
# http://tinyurl.com/4j83zdv
# http://tinyurl.com/2dq9pkv
function sc {
  if [ -x script/console ]; then
    script/console
  else
    rake console
  fi
}

function sdbc {
  if [ -x script/dbconsole ]; then
    script/dbconsole
  else
    rake dbconsole
  fi
}

sg () {
  if [ -f ./script/rails ]; then
    rails g $@
  else
    ./script/generate $@
  fi
}

ss () {
  if [ -f ./script/rails ]; then
    rails s $@
  else
    ./script/server $@
  fi
}
