#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Byron Dover <byrondover@gmail.com>
#
# Contributors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Set environment variables.
export PATH="/Users/byron/google-cloud-sdk/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman"

# Increase command line history cache size.
export HISTSIZE=1000000

# Function definitions.

# Wiredrive reverse DNS search functions.
h ()
{
  search='^[a-z]';
  domain=$1;
  host -la ${domain}.wiredrive.com | awk -F" " '{print $1}' | sed -e 's/\.$//g' | egrep ${search} | sort -V | uniq
}

# Local reverse DNS function.
lh ()
{
  search='^[a-z]';
  host -la 192.168.1.1 | awk -F" " '{print $1}' | sed -e 's/\.$//g' | egrep ${search} | sort -V | uniq
}

# Reverse DNS search across all Wiredrive data centers.
alh ()
{
  for x in mdr pv;
  do
    h ${arg} ${x};
  done
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/byron/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/byron/google-cloud-sdk/completion.zsh.inc'

# Source secure environment variables.
source '/Users/byron/.envrc'

# Python virtual environment aliases.
alias a="source /Users/byron/venv/bin/activate"
alias d="deactivate"
alias c="clear"

# virtualenvwrapper environment variables.
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code

# This can take a few seconds...
source /usr/local/bin/virtualenvwrapper.sh

# Pathing shortcuts.
alias vwd="cd ~/vagrant/vagrant-wiredrive; vagrant ssh"
alias wd="cd ~/Drive/code/wiredrive"
alias ws="cd ~/code/workshop"
