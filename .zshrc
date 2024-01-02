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

# Extend path
path=($HOME/bin $HOME/bin/google-cloud-sdk/bin $HOME/.config/yarn/global/node_modules/.bin $HOME/Library/Python/3.11/bin $GOPATH/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin)

# Enable command line comments
setopt interactivecomments

# LastPass recursive show function
lastpass ()
{

  for i in $(lpass ls | grep -i ${1:-''} | grep -i ${2:-''} | grep -i ${3:-''} | rev | cut -d ' ' -f 1 | tr -d ']' | rev); do
    lpass show $i
  done
}

# Local reverse DNS function
lh ()
{
  search='^[a-z]';
  host -la 192.168.1.1 | awk -F" " '{print $1}' | sed -e 's/\.$//g' | egrep ${search} | gsort -V | uniq
}

# Delete Git branch locally and on the remote origin
delete_from_git_origin() {
  git branch -D $1
  git push origin --delete $1
}

# The next line updates PATH for the Google Cloud SDK
if [[ -e "${HOME}/bin/google-cloud-sdk/path.zsh.inc" ]]; then
  source "${HOME}/bin/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud
if [[ -e "${HOME}/bin/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "${HOME}/bin/google-cloud-sdk/completion.zsh.inc"
fi

# Override .zprofile defaults
EDITOR='vim'
VISUAL='vim'

# Source secure environment variables
source "${HOME}/.envrc"

# Python virtual environment aliases
alias a="pipenv shell"
#alias a="[ -e ./venv/bin/activate ] && source ./venv/bin/activate || source ${HOME}/venv/bin/activate"
alias d="deactivate"
alias c="clear"

# This may take a few seconds...
alias v="source /usr/local/bin/virtualenvwrapper.sh"

# Pathing shortcuts
alias cdgo="cd ${GOPATH}"
alias gogo="cd ${GOPATH}"
alias ws="cd ${HOME}/code/workshop"

# Git shortcuts
alias gitlog='git log --graph --branches --date=relative --date-order --oneline --pretty="%C(yellow)%h%C(reset) %an %C(blue)%s %Cgreen(%cr)"'
alias ppp=delete_from_git_origin

# Node
alias n="source /usr/local/opt/nvm/nvm.sh"
alias webpack="/usr/bin/which -s webpack > /dev/null 2>&1 || ./node_modules/.bin/webpack"

# Time-savers
alias ppg="ping 8.8.8.8"
alias pping="ping 8.8.8.8"

# AdParlor
alias ap="cd ${HOME}/code/adparlor"
alias apgit='git config user.email "bdover@adparlor.com"; git config user.name "Byron Dover"; git config user.username "bdover-ap"'
alias apshuttle='ssh -i ~/.ssh/adparlor/aws-us-west-2.pem ec2-user@shuttle.adparlordev.com'
alias apshuttleprod='ssh -i ~/.ssh/adparlor/aws-us-west-2-prod.pem ec2-user@35.162.48.25'

# Riot Games
alias awskey='$(keyconjurer-darwin get -t 30 --ttl 8 it-applications)'
alias awskey-atlassian='$(keyconjurer-darwin get -t 30 --ttl 8 riot-atlassian)'
alias awskey-itapps='$(keyconjurer-darwin get -t 30 --ttl 8 it-applications)'
alias awskey-pr='$(keyconjurer-darwin get -t 30 --ttl 8 product-riot)'
alias b='$(keyconjurer-darwin get -t 30 --ttl 8 product-riot)'
alias cbd='sudo launchctl unload /Library/LaunchDaemons/com.carbonblack.daemon.plist; pkill -9 -f CbOsxSensorService'
alias rg="cd ${HOME}/code/riotgames"
alias rgit='git config user.email "bdover@riotgames.com"; git config user.name "Byron Dover"; git config user.username "bdover"'
alias rga="[ -e ${HOME}/.npmrc_bak ] && mv -f ${HOME}/.npmrc_bak ${HOME}/.npmrc || echo 'Already active.'"
alias rgd="[ -e ${HOME}/.npmrc ] && mv -f ${HOME}/.npmrc ${HOME}/.npmrc_bak || echo 'Already deactivated.'"
alias rgmac="sudo ifconfig en0 ether 78:4f:43:86:42:1b"
alias rgmacd="sudo ifconfig en0 ether f4:0f:24:25:70:97"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bdover/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bdover/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bdover/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bdover/bin/google-cloud-sdk/completion.zsh.inc'; fi


# Load Angular CLI autocompletion.
source <(ng completion script)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

