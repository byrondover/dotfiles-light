#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# virtualenvwrapper environment variables.
export PROJECT_HOME=$HOME/code
export WORKON_HOME=$HOME/.virtualenvs

export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
