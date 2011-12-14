#####
# Misc utils
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# https://gist.github.com/1270654
alias pow_restart='ll ~/.pow/tmp/restart.txt; touch ~/.pow/tmp/restart.txt; ll ~/.pow/tmp/restart.txt;'
alias rmfr='rm -fr';
alias exot='exit';
alias claer='clear;' # Nada puede malir sal
alias work='clear; cd ~/Documents/Repositorios/;'
alias find_text='grep -Rin'
alias find_usages='grep -ien'
alias create='touch'
alias be='bundle exec'
alias ber="bundle exec rake"
alias cuke="be cucumber -rfeatures -fprogress"
alias cake="rake"
alias tag="ctags -R app lib"
alias sublime="subl" # sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
alias reload_bash='source ~/.bash_profile'

#####
# Git http://library.edgecase.com/git_immersion/lab_11.html
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
#alias got='git '
#alias get='git '

#####
# Sinatra & Rails - http://tinyurl.com/4j83zdv
function sc {
  if [ -x script/console ]; then
    script/console
  else
    rake console
#    sinatra_rb=`egrep -l "^require.+sinatra.$" *.rb 2>/dev/null`
#    if [ -e $sinatra_rb ]; then
#      irb -r $sinatra_rb
#    else
#      irb
#    fi
  fi
}

#####
# Rails 2 & 3 - http://tinyurl.com/2dq9pkv (check also the .irbrc)

# rails 3 shortcut 'r'
alias r='rails'

# launching console/server
#sc () {
#  if [ -f ./script/rails ]; then 
#    rails c $@
#  else
#    ./script/console $@
#  fi
#}

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

sspe () {
  if [ -f ./script/rails ]; then 
    sudo rails s -p80 $@
  else
    sudo ./script/server -p80 $@
  fi
}

# database migrate
alias rdbm='rake db:migrate'

# tests
alias rspec='rake spec'

# rails logs, tailing and cleaning
alias rails_log='tail -f ./log/development.log'
alias rails_test_log='tail -f ./log/test.log'
alias pow_log='tail -f ~/Library/Logs/Pow/access.log'

alias ctl='> ./log/test.log'
alias cdl='> ./log/development.log'
