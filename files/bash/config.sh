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
# RVM (warning rbenv/rvm are incompatibles)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=$PATH:$HOME/.rvm/bin;

# RVM + XCode with osx-gcc-installer - https://github.com/kennethreitz/osx-gcc-installer
# export CC=/usr/bin/gcc-4.2

# This fix MySQL: Library not loaded: libmysqlclient.18.dylib (LoadError)
# But WARNING, setting DYLD_LIBRARY_PATH can break dynamic linking.
# export export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

################################################################################
# rbenv (warning rbenv/rvm are incompatibles)
export PATH="$HOME/.rbenv/bin:$PATH" # rbenv
eval "$(rbenv init -)"

################################################################################
# Homebrew should be before system-provided path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Personal
export DEV_ENV="vagrant";
export EDITOR="subl"
