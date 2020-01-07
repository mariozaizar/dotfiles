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

# Ruby & Bundler
alias be='bundle exec'
alias bi='bundle check || bundle install --local'
alias bu='bundle update'

# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias repush='git commit --amend --no-edit; git push --force;'

# vim
alias vi='vim'

# OSX
alias show_hidden_fikes_mac='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide_hidden_files_mac='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
