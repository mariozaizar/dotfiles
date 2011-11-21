[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#####
# Promt with git & rvm - http://tinyurl.com/4q6zehb
__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" != "" ] && version="$version"
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}

function vagrant_status {
  local status=""

  if [ -f 'Vagrantfile' ]; then
    if which vagrant > /dev/null;  then
      status="vagrant!"
      # status="$(vagrant status | sed -n 3p)"
      # status="$(echo $status)"
    else
      status="Vagrantfile!"
    fi
  fi
  [ "$status" != "" ] && echo " ($status)"

  # Example:
  # PS1="\u@\h$(vagrant_status)"
}

# https://gist.github.com/778558
function git_status {
  local git_dir="$(__gitdir)"
  local git_branch=""
  
  if [ -n "$git_dir" ]; then
    git_branch=`__git_ps1 "%s"`      
    
    local now=`date +%s`
    local last_commit=`git log --pretty=format:'%at' -1`
    local sec_ago=$((now - last_commit))
    local min_ago=$((sec_ago/60))
  fi
    
  [ "$git_branch" != "" ] && echo "${git_branch} ${min_ago}m"
}

# Devpromt - http://tinyurl.com/4kzgb7k
if [ "$color_prompt" = yes ]; then
  #  Negro       0;30     Gris Obscuro  1;30
  #  Azul        0;34     Azul Claro    1;34
  #  Verde       0;32     Verde Claro   1;32
  #  Cyan        0;36     Cyan Claro    1;36
  #  Rojo        0;31     Rojo Claro    1;31
  #  Purpura     0;35     Fiuscha       1;35
  #  Café        0;33     Amarillo      1;33
  #  Gris Claro  0;37     Blanco        1;37

  # Simple: 
  # PS1="\u@\h" # => mario@mario-laptop
  
  # Two lines:
  line1="\[\e[1;34m\]\T \[\e[1;33m\]\w\n"
  line2='\[\e[1;36m\]$(rvm_version)$(git_status)$(vagrant_status)\[\e[1;33m\] \$ \[\e[1;37m\]'
  PS1="$line1$line2"
else
  PS1="\T $(rvm_version)$(git_status)$(vagrant_status)\w \$ "
fi
unset color_prompt force_color_prompt

#####

# grep 2.5.1
export GREP_OPTIONS="-i --exclude=\*.git\* --exclude=\*log\* --exclude=\*tmp\*"
# grep 2.5.3
#export GREP_OPTIONS="-i --exclude-dir=.git --exclude-dir=log --exclude-dir=tmp"

# GiveHub
export MONGOHQ_HOST='33.33.33.10'

# MySQL: Library not loaded: libmysqlclient.18.dylib (LoadError)
export export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# MacPorts Installer addition on 2011-06-16_at_22:14:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

test -r /sw/bin/init.sh && . /sw/bin/init.sh