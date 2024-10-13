# ~/.zshrc: Custom configuration for a personalized and productive work environment.

# =====================
# ZSH CONFIGURATION
# =====================
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# Disable command auto-correction.
DISABLE_CORRECTION="true"

# Set the maximum nesting level to prevent recursion errors.
export FUNCNEST=1000

# Display dots while waiting for completions.
COMPLETION_WAITING_DOTS="true"

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

# Detect and display the Python virtual environment in the prompt
virtualenv_prompt() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "%F{yellow}($(basename $VIRTUAL_ENV))%f "
    fi
}

# Update custom prompt to show the virtual environment
custom_prompt() {
    local ip_address=$(hostname -I | cut -d' ' -f1)
    
    # Add virtualenv info to the prompt
    PROMPT='$(virtualenv_prompt)%F{green}%n@%m%f:%F{blue}%~%f $(parse_git_branch) $(parse_git_dirty) %F{purple} [%D{%H:%M}]%f %F{cyan}[IP: '"$ip_address"']%f
→ %F{white}$ %f'
}

# Apply the custom prompt format
precmd_functions+=(custom_prompt)


# =====================
# CUSTOM FUNCTIONS
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

# =====================
# PROMPT CONFIGURATION
# =====================
# Parse current Git branch and show in prompt
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Show git status symbols (✔ for changes staged, ✘ for unstaged changes)
parse_git_dirty() {
    git diff --quiet 2>/dev/null
    [ $? -eq 1 ] && echo "✘" || echo "✔"
}

# Custom prompt definition with proper new line placement
custom_prompt() {
    local ip_address=$(hostname -I | cut -d' ' -f1)

    # Properly define the prompt with a new line before the arrow and $ sign
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f $(parse_git_branch) $(parse_git_dirty) %F{purple} [%D{%H:%M}]%f %F{cyan}[IP: '"$ip_address"']%f
→ %F{white}$ %f'
}

# Apply the custom prompt format.
precmd_functions+=(custom_prompt)

# =====================
# HELPER FUNCTION TO DISPLAY COMMANDS
# =====================
# Wrapper function to display the command being executed
run_command() {
    echo "Executing: $@"
    eval "$@"
}

# =====================
# RECREATING ALIASES WITH FUNCTIONS
# =====================
# Directory Navigation Functions
cd_up_one() { run_command "cd .."; }
cd_up_two() { run_command "cd ../.."; }
cd_up_three() { run_command "cd ../../.."; }
go_home() { run_command "cd ~"; }

# Directory listing functions
list_all_long() { run_command "ls -alhF --group-directories-first"; }
list_all() { run_command "ls -A"; }
list_compact() { run_command "ls -CF"; }
list_time_sorted() { run_command "ls -lhtr"; }

# Git functions
git_status() { run_command "git status"; }
git_add_all() { run_command "git add ."; }
git_commit() { run_command "git commit -m '$@'"; }
git_checkout() { run_command "git checkout '$@'"; }
git_push() { run_command "git push"; }
git_log() { run_command "git log --oneline --graph --decorate --all"; }
git_push_origin() { run_command "git push origin $(git rev-parse --abbrev-ref HEAD)"; }

# Docker functions (if applicable)
docker_ps() { run_command "docker ps"; }
docker_ps_all() { run_command "docker ps -a"; }
docker_rm_all() { run_command "docker rm $(docker ps -a -q)"; }
docker_clean() { run_command "docker system prune -a"; }

# Kubernetes functions (if applicable)
kubectl_cmd() { run_command "kubectl '$@'"; }
kubectl_get_pods() { run_command "kubectl get pods"; }
kubectl_get_services() { run_command "kubectl get services"; }
kubectl_get_contexts() { run_command "kubectl config get-contexts"; }
kubectl_use_context() { run_command "kubectl config use-context"; }

# AWS CLI functions (if applicable)
aws_profile() { run_command "aws configure --profile '$@'"; }

# System functions
system_update() { run_command "sudo apt update && sudo apt upgrade -y"; }
system_cleanup() { run_command "sudo apt autoremove -y && sudo apt autoclean"; }
show_ip() { run_command "hostname -I"; }
list_ports() { run_command "sudo netstat -tulanp | grep LISTEN"; }
system_resources() { run_command "top -o %MEM"; }

# File management functions
safe_rm() { run_command "rm -f '$@'"; }
safe_cp() { run_command "cp -rf '$@'"; }
safe_mv() { run_command "mv -f '$@'"; }

# Python virtual environment management
python_venv() { run_command "python3 -m venv .venv && source .venv/bin/activate"; }
python_activate() { run_command "source .venv/bin/activate"; }
python_deactivate() { deactivate; }

# VS Code command
code_project() { run_command "code . && exit"; }

# Show top 10 most frequently used commands
top_cmds() { run_command "history | awk '{CMD[\$2]++;count++;} END { for (a in CMD)print CMD[a] \" \" a;}' | sort -rn | head -10"; }

# Display welcome message on startup
display_welcome_message

cheatsheet() {
    local output_file="/mnt/c/dev/cheatsheet.md"
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
