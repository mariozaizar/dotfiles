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

# Colorize the Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

################################################################################
function ruby_version {
  local version='';
  if which rbenv > /dev/null; then
    # rbenv installed
    version="rbenv $(rbenv_version)";
  elif which rbenv > /dev/null; then
    # rvm installed
    version=echo "rvm $(rvm_version)";
  elif [ -f '.rbenv_version' ]; then
    # rbenv_version detected
    version=".rbenv_version!";
  elif [ -f '.rvmrc' ]; then
    # rvmrc detected
    version=".rvmrc!";
  fi
  [ "$version=" != '' ] && echo "($version)"
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
    if which vagrant > /dev/null;  then
      status="$(bundle exec vagrant status | sed -n 3p)"
      status="$(echo $status)"
    else
      status="Vagrantfile!"
    fi
  fi
  [ "$status" != "" ] && echo " ($status)"
}

# https://gist.github.com/778558
__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "%s" "${b##refs/heads/}";
    fi
}

function time_ago {
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
    time_ago="${hrs}:${real_min}h"
  else
    time_ago="${min}m"
  fi
  [ "$time_ago" != "" ] && echo "${time_ago}"
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
    # local commiter=`git config user.email`
    # local last_commiter=`git log --pretty=format:'by %cN' -1`
  fi

  [ "$git_branch" != "" ] && echo " (${git_branch} ${min_ago}m)"
}

# BETA 2 http://tinyurl.com/4q6zehb
function git_info {
  if [ -n "$(__gitdir)" ]; then
    git_branch=`__git_ps1 "%s"`

    local last_commit=$(time_ago `git log --pretty=format:'%at' -1`);
    local last_mine=$(time_ago `git mine --pretty=format:'%at' -1`);
    echo "${git_branch}${last_commit}/${last_mine}";
  fi
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

  line1="\[\e[1;34m\]\T \[\e[1;33m\]\w\n"
  line2='\[\e[1;36m\]$(ruby_version)$(git_status)$(vagrant_status)\[\e[1;33m\] \$ \[\e[0;37m\]'
  PS1="$line1$line2"

  # BETA 2
  # line1="\n\[\e[1;34m\]\@ \[\e[1;33m\]\w"
  # line2="\[\e[1;36m\]$(ruby_version) $(vagrant_status)"
  # line3="\[\e[1;36m\]$(git_info)"
  # PS1="$line1\n$line2\n$line3 \[\e[1;33m\]\$ \[\e[0;37m\]"
else
  line1="\T \w\n"
  line2='$(ruby_version)$(git_status)$(vagrant_status) \$ '
  PS1="$line1$line2"

  # BETA 2
  # line1="\n\@ \w"
  # line2="$(ruby_version) $(vagrant_status)"
  # line3="$(git_info)"
  # PS1="$line1\n$line2\n$line3 \$ "
fi
unset color_prompt force_color_prompt
