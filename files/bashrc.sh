source ~/.bash_config
source ~/.bash_prompt
source ~/.bash_aliases
source ~/.bash_completion

# Use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
