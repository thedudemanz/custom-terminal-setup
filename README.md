# Custom Terminal Setup

Welcome to the **Custom Terminal Setup** project! This setup customizes your terminal environment to make it highly productive and personalized, even if you are new to terminal usage. Whether you're a developer or just looking to optimize your terminal experience, this guide will walk you through everything.

## Overview

This setup offers the following features:

- A **custom Zsh prompt** that displays your username, hostname (computer name), current directory, Git branch, and a timestamp.
- **Git integration** with easy-to-use shortcuts for common Git commands (like `git status`, `git add`, `git push`, etc.).
- **System Information** displayed every time you open your terminal: uptime, memory usage, disk usage, and IP address.
- **Auto-completion and suggestions** as you type commands, making it easier to use the terminal.
- **Aliases** (shortcuts) for quick navigation and executing common commands.
- Shortcuts for **Kubernetes** and **Docker** commands, making workflows with these tools faster.
- **Error Notifications** for high CPU or memory usage.
- **Git Branch Parsing** directly in the prompt.

## Prerequisites

Before you start, make sure you have the following installed:

- **Zsh (Z shell)**: A powerful alternative to the default shell on many systems. It’s commonly used with Oh My Zsh.
- **Oh My Zsh**: A framework for managing your Zsh configuration.
- **Powerlevel10k** (optional but recommended): A fast, highly customizable Zsh prompt.

## Installation

Follow these steps to set up your custom terminal environment:

1. **Install Zsh and Oh My Zsh**:

   First, you need to install **Zsh** and **Oh My Zsh**.

   - For **Ubuntu/Debian** systems:

     Open your terminal and run:
     ```bash
     sudo apt install zsh
     ```

     After the installation, make Zsh your default shell:
     ```bash
     chsh -s $(which zsh)
     ```

     Then install **Oh My Zsh** by running:
     ```bash
     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     ```

2. **Clone the Repository**:

   Download this repository by running:
   ```bash
   git clone https://github.com/thedudemanz/custom-terminal-setup.git

3. **Copy the `.zshrc` Configuration**:

   Copy the configuration file to your home directory:
   ```bash
   cp custom-terminal-setup/.zshrc ~/.zshrc

4. **Install Zsh Plugins**:

   To enable auto-suggestions and syntax highlighting, you will need to install the following plugins:

   - **Zsh Syntax Highlighting** (highlights commands as you type):
     ```bash
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     ```

   - **Zsh Auto-Suggestions** (suggests previous commands as you type):
     ```bash
     git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     ```

5. **Source the .zshrc File**:

   After completing the above steps, you need to load the new configuration. Run the following command:
   ```bash
   source ~/.zshrc

## Aliases and Shortcuts

Here are some of the available shortcuts and their respective commands:

- **`ll`**: `ls -alhF --group-directories-first` (List files in long format, including hidden files).
- **`la`**: `ls -A` (List hidden files only).
- **`gs`**: `git status 2>/dev/null || echo "Not inside a Git repository!"` (Git status).
- **`ga`**: `git add .` (Git add all changes).
- **`gc`**: `git commit -m` (Git commit with a message).
- **`gco`**: `git checkout` (Git checkout).
- **`gp`**: `git push` (Git push).
- **`gpo`**: `git push origin $(git rev-parse --abbrev-ref HEAD)` (Git push to origin, current branch).
- **`k`**: `kubectl` (Kubernetes command shortcut).
- **`dps`**: `docker ps` (Show active Docker containers).
- **`dclean`**: `docker system prune -a` (Clean up Docker containers and system).
- **`venv`**: `python3 -m venv .venv && source .venv/bin/activate` (Create a Python virtual environment in `.venv` and activate it).

## Additional Shortcuts

### File Management

- **`rm`**: `rm -f` (Forcefully remove files without asking for confirmation).
- **`cp`**: `cp -rf` (Copy files recursively and overwrite without confirmation).
- **`mv`**: `mv -f` (Move files and overwrite without confirmation).

### System Commands

- **`update`**: `sudo apt update && sudo apt upgrade -y` (Update and upgrade system packages).
- **`cleanup`**: `sudo apt autoremove -y && sudo apt autoclean` (Clean up system by removing unused packages and clearing cache).
- **`showip`**: `hostname -I` (Display internal IP address).
- **`ports`**: `sudo netstat -tulanp | grep LISTEN` (Display active network connections and listening ports).

## Git Shortcuts

- **`gs`**: Quickly check the status of your repository.
- **`ga`**: Stage all files for commit.
- **`gc`**: Commit staged changes with a message.
- **`gp`**: Push commits to the remote repository.
- **`gl`**: `git log --oneline --graph --decorate --all` (View a compact log of commits, with decoration and graph).

## System Information

Upon starting the terminal, you’ll see:

- Uptime of the system.
- Memory and disk usage.
- IP address.
- **Battery Status** (if applicable).

## Custom Functions

### Quick Project Navigation

- **`proj [name]`**: Quickly navigate to a pre-defined project directory.
- **`mkproj [name]`**: Create a new project folder and navigate into it.

### Resource Monitoring

- **`resources`**: `top -o %MEM` (Display active processes, sorted by memory usage).
- **`resource_alert`**: Monitor CPU and memory usage, sending alerts if thresholds are crossed.

### TODO List

- **`todo add [task]`**: Add a task to the TODO list.
- **`todo list`**: View the current TODO list.
- **`todo clear`**: Clear all tasks from the TODO list.

### Cheatsheet

- **`cheatsheet`**: Generate and open a markdown file with all your current aliases and shortcuts.

## Contributing

Feel free to fork this repository, make improvements, and open a pull request! Contributions are always welcome.

---

### Author

Created and maintained by **[tdmz](https://github.com/thedudemanz)**.

# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2024-10-11
### Added
- Uploaded `README.md` with detailed instructions on how to set up the terminal environment.
- Included a structured guide on installing Zsh, Oh My Zsh, and Zsh plugins (Auto-suggestions, Syntax Highlighting).
- Added detailed list of aliases and shortcuts, including Git, Docker, Kubernetes, and file management.
- Provided system information display upon terminal startup (uptime, memory, disk usage, IP).
- Uploaded `.zshrc` template with custom configurations for prompt, shortcuts, and functions.
- Added instructions for creating a Python virtual environment and activating it.
- Provided custom functions for project navigation, resource monitoring, and TODO list creation.
- Included error notifications for high CPU or memory usage.
- Added a command to generate a cheatsheet listing all aliases and shortcuts.

### Changed
- Updated initial `README.md` to include step-by-step instructions for setting up the environment from scratch.
- Adjusted `.zshrc` configuration for improved readability and functionality.

### Fixed
- Addressed formatting issues in the `README.md` file to ensure Markdown compatibility.
- Resolved syntax errors in the `.zshrc` file related to plugin installation paths.

---

## [1.0.0] - 2024-10-10
### Added
- Initial release of the **Custom Terminal Setup** project.
- Custom Zsh prompt with username, hostname, current directory, Git branch, and timestamp.
- Git integration with shortcuts for `git status`, `git add`, `git push`, and more.
- Display of system information (uptime, memory usage, disk usage, IP address) on terminal startup.
- Auto-completion and command suggestions.
- Shortcuts for common commands, file management, Docker, Kubernetes, and system tasks.
- Custom functions for project navigation, resource monitoring, and a TODO list.
- Auto-suggestions and syntax highlighting for the terminal.
- Cheatsheet generation with all aliases and shortcuts.

