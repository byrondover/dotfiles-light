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

# Extend path.
path=($HOME/bin $GOPATH/bin $HOME/bin/google-cloud-sdk/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin)

# Enable command line comments.
setopt interactivecomments

# Local reverse DNS function.
lh ()
{
  search='^[a-z]';
  host -la 192.168.1.1 | awk -F" " '{print $1}' | sed -e 's/\.$//g' | egrep ${search} | gsort -V | uniq
}

# Delete Git branch locally and on the remote origin.
delete_from_git_origin() {
  git branch -D $1
  git push origin --delete $1
}

# The next line updates PATH for the Google Cloud SDK.
if [[ -e "${HOME}/bin/google-cloud-sdk/path.zsh.inc" ]]; then
  source "${HOME}/bin/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [[ -e "${HOME}/bin/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "${HOME}/bin/google-cloud-sdk/completion.zsh.inc"
fi

# Source secure environment variables.
source "${HOME}/.envrc"

# Python virtual environment aliases.
alias a="[ -e ./venv/bin/activate ] && source ./venv/bin/activate || source ${HOME}/venv/bin/activate"
alias d="deactivate"
alias c="clear"

# This may take a few seconds...
alias v="source /usr/local/bin/virtualenvwrapper.sh"

# Pathing shortcuts.
alias ws="cd ${HOME}/code/workshop"

# Git shortcuts.
alias gitlog='git log --graph --branches --date=relative --date-order --oneline --pretty="%C(yellow)%h%C(reset) %an %C(blue)%s %Cgreen(%cr)"'
alias ppp=delete_from_git_origin

# Time-savers.
alias ppg="ping 8.8.8.8"
alias pping="ping 8.8.8.8"

# AdParlor
alias ap="cd ${HOME}/code/adparlor"
alias apgit='git config user.email "bdover@adparlor.com"; git config user.name "Byron Dover"; git config user.username "bdover-ap"'
alias apshuttle='ssh -i ~/.ssh/adparlor/aws-us-west-2.pem ec2-user@shuttle.adparlordev.com'
