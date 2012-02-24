source ~/.bash_config # rvm/rbenv, homebrew, paths
source ~/.bash_promt
source ~/.bash_aliases
source ~/.bash_completion

# Use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
