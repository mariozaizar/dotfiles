# Utils
###############################################################################
alias work='clear; cd <%= @projects_dir %>;'
###############################################################################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias exot='exit'
alias claer='clear;' # Nada puede malir sal
alias create='touch'
alias find_text='grep -Rin --color'
alias find_usages='grep -ien --color'
alias reload='source ~/.bash_profile'

# Ruby
alias be='bundle exec'
alias cuke="be cucumber -rfeatures -fprogress"
alias pow_log='tail -f ~/Library/Logs/Pow/access.log'
alias pow_restart='echo "Restarting pow..."; touch tmp/restart.txt'

# Git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

# Rails
alias r='rails'
alias rails_log='tail -f ./log/development.log | grep --invert-match DEBUG'
alias rails_test_log='tail -f ./log/test.log | grep --invert-match DEBUG'

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
