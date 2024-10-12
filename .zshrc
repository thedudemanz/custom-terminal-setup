# ~/.zshrc: Custom configuration for a personalized and productive work environment.

# =====================
# ZSH CONFIGURATION
# =====================
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# Disable command auto-correction.
DISABLE_CORRECTION="true"

# Change history timestamp format to "mm/dd/yyyy".
HIST_STAMPS="mm/dd/yyyy"

# Load essential plugins for Zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh with plugins.
source $ZSH/oh-my-zsh.sh

# Enable zsh-autosuggestions.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Enable zsh-syntax-highlighting.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

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
alias reloadzsh='source ~/.zshrc'
alias showip='hostname -I'
alias ports='sudo netstat -tulanp | grep LISTEN'
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
# PROMPT CONFIGURATION
# =====================
# Custom prompt with username, host, directory, git branch, and status
custom_prompt() {
    local ip_address=$(hostname -I | cut -d' ' -f1)

    # Properly define the prompt with a new line before the arrow and $ sign
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f $(parse_git_branch) $(parse_git_dirty) %F{purple} [%D{%H:%M}]%f %F{cyan}[IP: '"$ip_address"']%f
→ %F{white}$ %f'
}

# Apply the custom prompt format.
precmd_functions+=(custom_prompt)

# =====================
# SYSTEM INFORMATION AND WELCOME MESSAGE
# =====================
# Function to print a centered welcome message
center_text() {
    local text="$1"
    if command -v tput &> /dev/null; then
        local term_width=$(tput cols)
        local padding=$(($term_width / 2 - ${#text} / 2))
        printf "%${padding}s%s\n" " " "$text"
    else
        echo "$text"
    fi
}

# Function to display a welcome message with system information
display_welcome_message() {
    center_text "--------------------------------"
    center_text "🚀 Welcome back, $USER! One line at a time 🚀"
    center_text "--------------------------------"
    center_text "🖥️ System Information 🖥️"
    center_text "--------------------------------"
    center_text "Uptime: $(uptime -p)"
    center_text "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    center_text "Disk Usage: $(df -h / | grep / | awk '{print $3 "/" $2}')"
    center_text "IP Address: $(hostname -I | cut -d' ' -f1)"
    center_text "--------------------------------"
}

# Display welcome message on startup
display_welcome_message

# =====================
# GENERATE CHEATSHEET
# =====================
cheatsheet() {
    local output_file="/mnt/c/dev/zsh_cheatsheet.md"
    echo "Generating Cheatsheet at $output_file"
    cat <<EOL > $output_file
### Cheatsheet: Terminal Commands & Shortcuts

---

#### **Directory Navigation**
- \`..\` — Move up one directory.
- \`...\` — Move up two directories.
- \`....\` — Move up three directories.
- \`~\` — Go to the home directory.
- \`ll\` — List files with detailed info, grouping directories first.
- \`la\` — List all files (including hidden).
- \`l\` — List files in columns.
- \`lt\` — List files sorted by modification time.

---

#### **Git Shortcuts**
- \`gs\` — Show the status of the Git repository.
- \`ga\` — Stage all changes.
- \`gc\` — Commit changes with a message (e.g., \`gc "commit message"\`).
- \`gco\` — Checkout a branch.
- \`gp\` — Push changes to the current branch.
- \`gl\` — Display a graph of commits in one line.
- \`gpo\` — Push changes to the current branch on origin.

---

#### **Docker Shortcuts**
- \`dps\` — List active Docker containers.
- \`dpsa\` — List all Docker containers.
- \`drm\` — Remove all stopped containers.
- \`dclean\` — Remove all unused Docker objects.

---

#### **Kubernetes Shortcuts**
- \`k\` — General Kubernetes command (use like \`k get pods\`).
- \`kgp\` — List all Kubernetes pods.
- \`kgs\` — List all Kubernetes services.
- \`kctx\` — Get all Kubernetes contexts.
- \`kcn\` — Switch to a Kubernetes context.

---

#### **System Utilities**
- \`update\` — Update and upgrade all system packages.
- \`cleanup\` — Remove unused packages and clean up the system.
- \`showip\` — Display the internal IP addresses.
- \`ports\` — List all active listening ports.
- \`resources\` — Show the top resource-consuming processes.

---

#### **File Management**
- \`rm\` — Safely remove files (without prompt).
- \`cp\` — Safely copy files (without prompt).
- \`mv\` — Safely move files (without prompt).

---

#### **Python Virtual Environment**
- \`venv\` — Create a new Python virtual environment and activate it.
- \`activate\` — Activate an existing Python virtual environment.
- \`deactivate\` — Deactivate the current Python virtual environment.

---

#### **VS Code Shortcuts**
- \`codep\` — Open the current project in VS Code and exit the terminal.

---

#### **Miscellaneous**
- \`topcmds\` — Show the top 10 most frequently used commands in your history.

EOL
    echo "Cheatsheet created successfully at $output_file"
}

# Navigate to default working directory on new shell session
cd /mnt/c
