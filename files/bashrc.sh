[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # RVM

source ~/.bash_aliases
source ~/.bash_completion
source ~/.bash_promt
source ~/.bash_tweeks

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
