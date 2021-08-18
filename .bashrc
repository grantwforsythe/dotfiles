#!/bin/bash
iatest=$(expr index "$-" i)

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#######################################################
# Exports
#######################################################

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# Alias's
#######################################################

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'
alias evrc='edit ~/.vimrc'
alias sedit='edit ~/.shh/config'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'

# git aliases
alias g='git'
alias gc='git clone'
alias gco='git checkout'
alias gbr='git branch'
alias gnco='git checkout -b'
alias gs='git status'
alias gc='git commit'
alias gl='git log --pretty=oneline --abbrev-commit --graph'

# Change directory aliases
alias home='cd ~'
alias desktop='cd /mnt/c/Users/grant/Desktop'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# python
alias python='python3' 
alias pip='pip3'
alias venv='python -m venv venv && source venv/bin/activate'
alias deact='deactivate'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias lsd="ls -d */" # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to view the structure of a directory 
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

#######################################################
# Functions
#######################################################

# Extracts any archive(s) (if unp isn't installed)
extract () {
        for archive in $*; do
                if [ -f $archive ] ; then
                        case $archive in
                                *.tar.bz2)   tar xvjf $archive    ;;
                                *.tar.gz)    tar xvzf $archive    ;;
                                *.bz2)       bunzip2 $archive     ;;
                                *.rar)       rar x $archive       ;;
                                *.gz)        gunzip $archive      ;;
                                *.tar)       tar xvf $archive     ;;
                                *.tbz2)      tar xvjf $archive    ;;
                                *.tgz)       tar xvzf $archive    ;;
                                *.zip)       unzip $archive       ;;
                                *.Z)         uncompress $archive  ;;
                                *.7z)        7z x $archive        ;;
                                *)           echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}

# Searches for text in all files in the current folder
ftext ()
{
        # -i case-insensitive
        # -I ignore binary files
        # -H causes filename to be printed
        # -r recursive search
        # -n causes line number to be printed
        # optional: -F treat search term as a literal, not a regular expression
        # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
        grep -iIHrn --color=always "$1" . | less -r
}

# opens a file
# source : https://bobaekang.com/blog/using-open-command-in-wsl/
open ()
{
        Explorer.exe "$(wslpath -w $1)"
}

# Copy file with a progress bar
cpp()
{
        set -e
        strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
        | awk '{
        count += $NF
        if (count % 10 == 0) {
                percent = count / total_size * 100
                printf "%3d%% [", percent
                for (i=0;i<=percent;i++)
                        printf "="
                        printf ">"
                        for (i=percent;i<100;i++)
                                printf " "
                                printf "]\r"
                        }
                }
        END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
        if [ -d "$2" ];then
                cp $1 $2 && cd $2
        else
                cp $1 $2
        fi
}

# Move and go to the directory
mvg ()
{
        if [ -d "$2" ];then
                mv $1 $2 && cd $2
        else
                mv $1 $2
        fi
}

# Create and go to the directory
mkdirg ()
{
        mkdir -p $1
        cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
        local d=""
        limit=$1
        for ((i=1 ; i <= limit ; i++))
                do
                        d=$d/..
                done
        d=$(echo $d | sed 's/^\///')
        if [ -z "$d" ]; then
                d=..
        fi
        cd $d
}

# Show the current distribution
distribution ()
{
        local dtype
        # Assume unknown
        dtype="unknown"

        # First test against Fedora / RHEL / CentOS / generic Redhat derivative
        if [ -r /etc/rc.d/init.d/functions ]; then
                source /etc/rc.d/init.d/functions
                [ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"

        # Then test against SUSE (must be after Redhat,
        # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
        elif [ -r /etc/rc.status ]; then
                source /etc/rc.status
                [ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"

        # Then test against Debian, Ubuntu and friends
        elif [ -r /lib/lsb/init-functions ]; then
                source /lib/lsb/init-functions
                [ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"

        # Then test against Gentoo
        elif [ -r /etc/init.d/functions.sh ]; then
                source /etc/init.d/functions.sh
                [ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"

        # For Mandriva we currently just test if /etc/mandriva-release exists
        # and isn't empty (TODO: Find a better way :)
        elif [ -s /etc/mandriva-release ]; then
                dtype="mandriva"

        # For Slackware we currently just test if /etc/slackware-version exists
        elif [ -s /etc/slackware-version ]; then
                dtype="slackware"

        fi
        echo $dtype
}

# Show the current version of the operating system
ver ()
{
        local dtype
        dtype=$(distribution)

        if [ $dtype == "redhat" ]; then
                if [ -s /etc/redhat-release ]; then
                        cat /etc/redhat-release && uname -a
                else
                        cat /etc/issue && uname -a
                fi
        elif [ $dtype == "suse" ]; then
                cat /etc/SuSE-release
        elif [ $dtype == "debian" ]; then
                lsb_release -a
                # sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
        elif [ $dtype == "gentoo" ]; then
                cat /etc/gentoo-release
        elif [ $dtype == "mandriva" ]; then
                cat /etc/mandriva-release
        elif [ $dtype == "slackware" ]; then
                cat /etc/slackware-version
        else
                if [ -s /etc/issue ]; then
                        cat /etc/issue
                else
                        echo "Error: Unknown distribution"
                        exit 1
                fi
        fi
}

#######################################################
# Command Prompt
#######################################################

function __setprompt
{
        local LAST_COMMAND=$? # Must come first!

        # Define colors
        local LIGHTGRAY="\033[0;37m"
        local WHITE="\033[1;37m"
        local BLACK="\033[0;30m"
        local DARKGRAY="\033[1;30m"
        local RED="\033[0;31m"
        local LIGHTRED="\033[1;31m"
        local GREEN="\033[0;32m"
        local LIGHTGREEN="\033[1;32m"
        local BROWN="\033[0;33m"
        local YELLOW="\033[1;33m"
        local BLUE="\033[0;34m"
        local LIGHTBLUE="\033[1;34m"
        local MAGENTA="\033[0;35m"
        local LIGHTMAGENTA="\033[1;35m"
        local CYAN="\033[0;36m"
        local LIGHTCYAN="\033[1;36m"
        local NOCOLOR="\033[0m"

        # Show error exit code if there is one
        if [[ $LAST_COMMAND != 0 ]]; then
                # PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
                PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
                if [[ $LAST_COMMAND == 1 ]]; then
                        PS1+="General error"
                elif [ $LAST_COMMAND == 2 ]; then
                        PS1+="Missing keyword, command, or permission problem"
                elif [ $LAST_COMMAND == 126 ]; then
                        PS1+="Permission problem or command is not an executable"
                elif [ $LAST_COMMAND == 127 ]; then
                        PS1+="Command not found"
                elif [ $LAST_COMMAND == 128 ]; then
                        PS1+="Invalid argument to exit"
                elif [ $LAST_COMMAND == 129 ]; then
                        PS1+="Fatal error signal 1"
                elif [ $LAST_COMMAND == 130 ]; then
                        PS1+="Script terminated by Control-C"
                elif [ $LAST_COMMAND == 131 ]; then
                        PS1+="Fatal error signal 3"
                elif [ $LAST_COMMAND == 132 ]; then
                        PS1+="Fatal error signal 4"
                elif [ $LAST_COMMAND == 133 ]; then
                        PS1+="Fatal error signal 5"
                elif [ $LAST_COMMAND == 134 ]; then
                        PS1+="Fatal error signal 6"
                elif [ $LAST_COMMAND == 135 ]; then
                        PS1+="Fatal error signal 7"
                elif [ $LAST_COMMAND == 136 ]; then
                        PS1+="Fatal error signal 8"
                elif [ $LAST_COMMAND == 137 ]; then
                        PS1+="Fatal error signal 9"
                elif [ $LAST_COMMAND -gt 255 ]; then
                        PS1+="Exit status out of range"
                else
                        PS1+="Unknown error code"
                fi
                PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
        else
                PS1="" 
        fi
        
        # color of the user
        if [[ $EUID -ne 0 ]]; then
                PS1+="\[${GREEN}\]\u@" # Normal user
        else
                PS1+="\[${RED}\]\u@" # Root user
        fi

        # Current directory
        PS1+="\[${DARKGRAY}\]\h\[${BROWN}\]"

        if [[ $EUID -ne 0 ]]; then
                PS1+=" \[${YELLOW}\]$\[${NOCOLOR}\] " # Normal user
        else
                PS1+=" \[${RED}\]>\[${NOCOLOR}\] " # Root user
        fi

}
PROMPT_COMMAND='__setprompt'
