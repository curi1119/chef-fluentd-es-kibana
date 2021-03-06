#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set for flex compile option
export _JAVA_OPTIONS='-Duser.language=en -Duser.region=US'

# execute screen if screen detached
user_name=`whoami`
window_dir="/var/run/screen/S-$user_name"
if [ -d "$window_dir" ] ; then
  i=`find $window_dir -type p | wc -l`
  if [ "$i" -eq 1 ] ; then
    s -r
  fi
fi
export OPT_DIR=/opt
export APP_HOME=$OPT_DIR/app
export PATH=$OPT_DIR/bin:$PATH
export RUBYLIB=$OPT_DIR/lib/ruby:$RUBYLIB
