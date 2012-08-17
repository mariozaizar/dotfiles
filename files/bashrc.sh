source ~/.bash/config
source ~/.bash/prompt
source ~/.bash/aliases
source ~/.bash/completion

# Use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
