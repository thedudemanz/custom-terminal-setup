# Custom Zsh and TMUX Terminal Setup

## Overview
This repository contains a customized Zsh and TMUX terminal configuration tailored to enhance productivity for DevOps engineers and software developers. The configuration includes features like a personalized prompt, dynamic Git branch display, virtual environment detection, and a custom TMUX status bar.

Developed by a Fortune 300 DevOps engineer with four years of experience, this setup aims to streamline workflows, improve command-line usability, and provide relevant context right at your fingertips.

## Features

### Zsh Custom Configuration
- **Simplified prompt**: Minimalist prompt with a timestamp for each command.
- **Git Branch Display**: Automatically displays the current Git branch when navigating through repositories.
- **Virtual Environment Detection**: Shows the current Python virtual environment, making it easy to manage your environments.
- **Custom Welcome Message**: Welcoming and informative system status message when opening a new terminal.
- **Auto TMUX Start**: Automatically starts a TMUX session upon opening the terminal if one isn't already running.
- **Custom Commands and Aliases**: Includes useful shortcuts for directory navigation, Git operations, system functions, and more.

### TMUX Custom Status Bar
- **User, Hostname, and IP Address**: Displays the user and hostname, as well as the local IP address.
- **Working Directory**: Shows the current directory for quick context.
- **Virtual Environment & Git Branch**: Displays active Python virtual environments and current Git branch.
- **Tasks and Shell Type**: Number of active TMUX panes and current shell type.
- **Dynamic Updates**: Status bar updates every second, showing real-time data.

## Installation

### Prerequisites
- **Zsh**: Ensure that Zsh is installed. You can install it via:
  ```bash
  sudo apt install zsh
  ```
- **Oh My Zsh**: Install Oh My Zsh to manage Zsh configuration:
  ```bash
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
- **TMUX**: Install TMUX to enable multiple terminal panes and the custom status bar:
  ```bash
  sudo apt install tmux
  ```

### Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/custom-terminal-setup.git
   cd custom-terminal-setup
   ```

2. **Copy Configuration Files**
   ```bash
   cp zshrc_template ~/.zshrc
   cp tmux.conf_template ~/.tmux.conf
   ```

3. **Reload Configurations**
   - **Zsh**:
     ```bash
     source ~/.zshrc
     ```
   - **TMUX**:
     ```bash
     tmux
