if [ -n "$BASH_VERSION" ]
then
  if [ -e "$HOME/.bash_env" ]
  then . "$HOME/.bash_env"
  fi
  if [ -e "$CARGO_HOME/env" ]
  then . "$CARGO_HOME/env"
  fi
  if [ -e "$HOME/.bashrc" ]
  then . "$HOME/.bashrc"
  fi
fi
