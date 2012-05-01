# Enable colors for xterm-color
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# We have color support; assume it's compliant with Ecma-48
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
else
  color_prompt=no
fi

# TODO, verify if we really need this
color_prompt=yes
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

################################################################################
function ruby_version {
  local version='';
  if which rbenv > /dev/null; then
    # rbenv installed
    version="rbenv: $(rbenv_version)";
  elif which rvm > /dev/null; then
    # rvm installed
    version=echo "rvm: $(rvm_version)";
  elif [ -f '.rbenv_version' ]; then
    # rbenv_version detected
    version="(.rbenv_version)";
  elif [ -f '.rvmrc' ]; then
    # rvmrc detected
    version="(.rvmrc)";
  fi
  [ "$version=" != '' ] && echo "$version  "
}

function rbenv_version {
  echo "$(rbenv version | awk '{print $1}')"
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
    # This will work only for Vagrant +1.0
    if which vagrant > /dev/null;  then
      status="$(vagrant status | sed -n 3p)"
      status="$(echo $status)"
    else
      status="(vagrant)"
    fi
  fi
  [ "$status" != "" ] && echo "vagrant: $status "
}

# https://gist.github.com/778558
__git_ps1 ()
{
    local branch="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$branch" ]; then
        printf "%s" "${branch##refs/heads/}";
    fi
}

function time_ago {
  if [ -x $1 ]; then
    echo "?"
    exit;
  fi

  local now=`date +%s`;
  local sec=$((now - $1));
  local min=$((sec / 60));
  local hrs=$((sec / 3600));
  local day=$((sec / 86400));

  local real_hrs=$((hrs % 24));
  local real_min=$((min % 60));

  if [ "$hrs" -gt 24 ]; then
    time_ago="${day}d"
  elif [ "$min" -gt 60 ]; then
    time_ago="${hrs}h"
  else
    time_ago="${min}m"
  fi
  [ "$time_ago" != "" ] && echo "${time_ago}"
}

# http://tinyurl.com/4q6zehb, https://gist.github.com/778558
function git_info {
  if [ -n "$(__gitdir)" ]; then
    git_branch=`__git_ps1 "%s"`

    local last_commit=$(time_ago `git log --pretty=format:'%at' -1 2>/dev/null;`);
    local last_mine=$(time_ago `git mine --pretty=format:'%at' -1 2>/dev/null;`);
    echo "${git_branch}: ${last_commit}/${last_mine}  ";
  fi
}

################################################################################
# Devpromt - http://tinyurl.com/4kzgb7k (colors from 0;30 to 0;37)

#  Negro       0;30     Gris Obscuro  1;30
#  Azul        0;34     Azul Claro    1;34
#  Verde       0;32     Verde Claro   1;32
#  Cyan        0;36     Cyan Claro    1;36
#  Rojo        0;31     Rojo Claro    1;31
#  Purpura     0;35     Fiuscha       1;35
#  Café        0;33     Amarillo      1;33
#  Gris Claro  0;37     Blanco        1;37

# Note: don't mess with other's promts. Don't use export PS1
if [ "$color_prompt" = yes ]; then
  line1='\n\[\e[1;33m\]\w'
  line2='\n\[\e[1;36m\]$(ruby_version)$(git_info)$(vagrant_status)'
  line3='\n\[\e[1;34m\](\@) \[\e[1;34m\]\W \[\e[1;33m\]\$ \[\e[0;37m\]'

  PS1="${line1}${line2}${line3}"
else
  line1='\n\w'
  line2='\n$(ruby_version)$(git_info)$(vagrant_status)'
  line3='\n(\@) \W \$ '

  PS1="${line1}${line2}${line3}"
fi

unset color_prompt
