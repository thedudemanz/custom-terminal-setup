# ~/.bashrc: Custom configuration for a personalized and productive work environment.

# =====================
# GENERAL CONFIGURATIONS
# =====================

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set history options: avoid duplicates, ignore commands starting with space
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# Enable color support of common commands and set default aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable programmable completion features if available
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# =====================
# CUSTOM ALIASES AND SHORTCUTS
# =====================

# Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'  # Quickly go to the home directory

# Quick directory listing
alias ll='ls -alhF --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhtr'

# Git Aliases for Speed
alias gs='git status 2>/dev/null || echo "Not inside a Git repository!"'
alias ga='git add .'
alias gc='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gpo='git push origin $(git rev-parse --abbrev-ref HEAD)'

# Docker Aliases (if applicable)
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drm='docker rm $(docker ps -a -q)'
alias dclean='docker system prune -a'

# Kubernetes Aliases (if applicable)
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kctx='kubectl config get-contexts'
alias kcn='kubectl config use-context'

# AWS CLI Aliases (if applicable)
alias awsprofile='aws configure --profile'

# System Aliases
alias update='sudo apt update && sudo apt upgrade -y'
alias cleanup='sudo apt autoremove -y && sudo apt autoclean'
alias reloadbash='source ~/.bashrc'
alias showip='hostname -I'
alias ports='sudo netstat -tulanp | grep LISTEN'  # Fix for missing ports alias
alias resources='top -o %MEM'

# Network Utilities
alias myip='curl -s ifconfig.me'
alias weather='curl -s wttr.in'

# File Management
alias rm='rm -f'
alias cp='cp -rf'
alias mv='mv -f'

# Python Virtual Environment
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias activate='source .venv/bin/activate'
alias deactivate='deactivate'

# VS Code Integration
alias codep='code . && exit'

# Show top 10 most frequently used commands
alias topcmds="history | awk '{CMD[\$2]++;count++;} END { for (a in CMD)print CMD[a] \" \" a;}' | sort -rn | head -10"

# =====================
# CUSTOM FUNCTIONS
# =====================

# Quick navigation to frequently accessed directories
proj() {
    if [ -d "/mnt/c/dev/$1" ]; then
        cd /mnt/c/dev/$1
    else
        echo "The directory /mnt/c/dev/$1 does not exist."
    fi
}

# Create a new project directory and navigate into it
mkproj() {
    mkdir -p /mnt/c/dev/$1 && cd /mnt/c/dev/$1
    echo "Created and moved to /mnt/c/dev/$1"
}

# Show current branch and status in the command prompt
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Show git status symbols (✔ for changes staged, ✘ for unstaged changes)
parse_git_dirty() {
    git diff --quiet 2>/dev/null
    [ $? -eq 1 ] && echo "✘" || echo "✔"
}

# =====================
# ENVIRONMENT VARIABLES AND PROMPT
# =====================

# Custom PATH additions (if needed)
export PATH="$HOME/.local/bin:$PATH"

# Show a custom prompt with username, host, directory, git branch, and status
PS1='\[\033[01;32m\]tdmz@\h\[\033[01;34m\]:\[\033[01;34m\]\w\[\033[01;33m\] $(parse_git_branch) $(parse_git_dirty)\[\033[01;35m\] [$(date +%H:%M)] [IP: $(hostname -I | cut -d" " -f1)]\[\033[00m\]\$ '

# Set terminal title to user@host:current_directory
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;tdmz@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Navigate to default working directory on new shell session
cd /mnt/c
