source ~/.bash/config
source ~/.bash/prompt
source ~/.bash/aliases
source ~/.bash/completion

# Personal settings (should not overrided)
if [ -f ~/.personal ]; then
  source ~/.personal;
fi
