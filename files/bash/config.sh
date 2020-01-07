# grep default options
grep_version=`grep --version | grep 2.5.3`
if [ "$grep_version" == "" ]; then
  # 2.5.1
  export GREP_OPTIONS="-i --exclude=\*.git\* --exclude=\*log\* --exclude=\*tmp\* --exclude=\*.tmp\*"
else
  # 2.5.3
  export GREP_OPTIONS="-i --exclude-dir=.git --exclude-dir=log --exclude-dir=tmp --exclude-dir=.tmp"
fi

################################################################################
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH";

if which rbenv > /dev/null; then
  # rbenv installed
  export PATH=$(rbenv root)/shims:$(rbenv root)/bin:$PATH;
  eval "$(rbenv init -)";
fi

################################################################################
# Homebrew should be before system-provided path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# This fix MySQL: Library not loaded: libmysqlclient.18.dylib (LoadError)
# But WARNING, setting DYLD_LIBRARY_PATH can break dynamic linking.
# export export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# If atom is installed, make it as your default editor
if [ `which atom` ]; then
  export EDITOR="atom"
elif [ `which subl` ]; then
  # If sublime is installed, make it as your default editor
  # ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
  export EDITOR="subl -a"
fi

# git editor
export GIT_EDITOR="atom --wait"

# Prefer US English and use UTF-8
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

################################################################################
# NodeJs and CoffeeScript
# http://c.kat.pe/how-to-install-coffeescript-on-mac-os-x
export PATH="/usr/local/share/npm/bin:$PATH";
export NODE_PATH="/usr/local/lib/node";
