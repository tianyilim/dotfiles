# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\> '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Ensure that Jupyter Notebook is found
PATH=$PATH:~/.local/bin

### Don't use conda anymore (might screw up ROS) ###
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tianyilim/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/tianyilim/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/tianyilim/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/tianyilim/miniconda3/bin:$PATH"
#     fi
# fi
unset __conda_setup
# <<< conda initialize <<<

# Add support for powerline
if [ -f $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ]; then
    $HOME/.local/bin/powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
fi

# For Ranger to quit to whatever directory we were in (effectively doing a cd)
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# add Go to $PATH
export PATH=/usr/local/go/bin:$PATH

source /home/tianyilim/.config/broot/launcher/bash/br

# For Euler (ETH HPC cluster)
# alias euler="ssh -Y -i $HOME/.ssh/id_ed25519_euler tialim@euler.ethz.ch"

alias cdf1="cd ~/catkin_ws/src/race_stack/"

# aliases for different ROS distros
alias sros1="source /opt/ros/noetic/setup.bash"
alias sros2="source /opt/ros/galactic/setup.bash"
alias sf1="sros1; source ~/catkin_ws/devel/setup.bash"

alias sshnuc1="ssh -XC race_crew@192.168.192.16"
alias sshnuc2="ssh -XC race_crew@192.168.192.4"
alias sshnuc3="ssh -XC race_crew@192.168.192.135"
alias sshnuc4="ssh -XC race_crew@192.168.192.106"
alias sshnuc5="ssh -XC race_crew@192.168.192.200"

export ZEROTIER_IP="192.168.192.97"
alias pit_rviz1='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC1 rviz'
alias pit_rviz2='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC2 rviz'
alias pit_rviz3='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC3 rviz'
alias pit_rviz4='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC4 rviz'
alias pit_rviz5='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC5 rviz'

# Helpers for Pit Starter Source (if you just want to set the environment variables in your system)
alias pit1='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC1'
alias pit2='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC2'
alias pit3='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC3'
alias pit4='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC4'
alias pit5='source ~/catkin_ws/src/race_stack/f110_utils/scripts/pit_starter/pit_starter.sh "$ZEROTIER_IP" NUC5'

