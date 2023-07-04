# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Ruby
export PATH=$(rbenv root)/shims:$(rbenv root)/bin:$PATH;
eval "$(rbenv init -)";

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin";

# Default text editor
if [ `which subl` ]; then
  export EDITOR="subl --add --wait"
elif [ `which code` ]; then
  export EDITOR="code"
fi

# Locale (Prefer US English and use UTF-8)
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# NodeJs
export PATH="/usr/local/share/npm/bin:$PATH";
export NODE_PATH="/usr/local/lib/node";

# ZSH
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# Aliases
alias work='clear; cd <%= @projects_dir %>;'
alias claer='clear;'
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
alias st='stree .';
alias s='subl -a .';
alias be='bundle exec'
alias repush='git commit --amend --no-edit; git push --force;'
alias vi='vim'
alias show_hidden_files_mac='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide_hidden_files_mac='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

if [ -f ~/.personal ]; then
  source ~/.personal;
fi
