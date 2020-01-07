# The source of magic
source ~/.dotfiles

# Personal settings (should not overrided)
if [ -f ~/.personal ]; then
  source ~/.personal;
fi
