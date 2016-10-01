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

# This can take a few seconds...
source /usr/local/bin/virtualenvwrapper.sh

# Pathing shortcuts.
alias vwd="cd ~/vagrant/vagrant-wiredrive; vagrant ssh"
alias wd="cd ~/Drive/code/wiredrive"
alias ws="cd ~/code/workshop"

alias gitlog='git log --graph --branches --date=relative --date-order --oneline --pretty="%C(yellow)%h%C(reset) %an %C(blue)%s %Cgreen(%cr)"'
