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
# Ruby and friends (warning rbenv/rvm are incompatibles)
if [ `which rbenv` ]; then
  # rbenv installed with brew (or already in path)
  eval "$(rbenv init -)"

elif [ -e "$HOME/.rbenv/bin/rbenv" ]; then
  # rbenv installed
  export PATH="$HOME/.rbenv/bin:$PATH" # rbenv
  eval "$(rbenv init -)"

elif [ -e "$HOME/.rvm/scripts/rvm" ]; then
  # RVM installed
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  export PATH=$PATH:$HOME/.rvm/bin;

  # RVM + XCode with osx-gcc-installer - https://github.com/kennethreitz/osx-gcc-installer
  # export CC=/usr/bin/gcc-4.2
fi

################################################################################
# Homebrew should be before system-provided path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# This fix MySQL: Library not loaded: libmysqlclient.18.dylib (LoadError)
# But WARNING, setting DYLD_LIBRARY_PATH can break dynamic linking.
# export export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# If sublime is installed, make it as your default editor
if [ `which subl` ]; then
  export EDITOR="subl -w"
fi

# Increase the Garbage Collector limits for Ruby: http://goo.gl/IP8Jj
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
