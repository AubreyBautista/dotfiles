# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export TERM=xterm-color

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.

f_pushd() 
{
    pushd $1 > /dev/null
    dirs -v
}

function f_popd() 
{
    popd $1 > /dev/null
    dirs -v
}

shopt -s nocaseglob
alias vi=vim
alias td='cd $OLDPWD'
alias ls='ls -GFA'
alias ll='ls -lGA '
alias dirs='dirs -v'
alias pd=f_pushd
alias pop=f_popd
alias popd=f_popd
alias 0="pd"
alias 1="pd +1"
alias 2="pd +2"
alias 3="pd +3"
alias 4="pd +4"
alias 5="pd +5"
alias 6="pd +6"
alias 7="pd +7"
alias 8="pd +8"
alias 9="pd +9"
alias d=dirs
alias hgr='history | grep'

export EDITOR='vim'
export DISPLAY=:0.0

EC2_BASE=$HOME/.ec2
export EC2_HOME=/usr/local/share/ec2
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export EC2_PRIVATE_KEY=$EC2_BASE/adamf.pem
export EC2_CERT=$EC2_BASE/adamf.pem
export AWS_RDS_HOME=$HOME/apps/RDScli

# Python Virtual Environments
# Setting up the VirtualEnv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
source /usr/local/share/python/virtualenvwrapper.sh

export PATH=$HOME/bin:/opt/local/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$EC2_BASE/bin

