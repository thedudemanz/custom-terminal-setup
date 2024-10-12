# Custom Terminal Setup

Welcome to the **Custom Terminal Setup** project! This setup customizes your terminal environment to make it highly productive and personalized, whether you are using **Zsh** or **Bash**. Whether you're a developer or just looking to optimize your terminal experience, this guide will walk you through everything.

## Overview

This setup offers the following features:

- A **custom prompt** that displays your username, hostname, current directory, Git branch, and timestamp.
- **Git integration** with easy shortcuts for common Git commands (`git status`, `git add`, `git push`, etc.).
- **System Information** displayed on terminal startup: uptime, memory usage, disk usage, and IP address.
- **Auto-completion and suggestions** to improve command efficiency.
- **Aliases** for quick navigation and executing commands.
- Shortcuts for **Kubernetes** and **Docker** workflows.
- **Error Notifications** for high CPU or memory usage.
- **Git Branch Parsing** directly in the prompt.

## Prerequisites

Before you start, make sure you have the following installed:

### For Zsh
- **Zsh (Z shell)**: Commonly used with Oh My Zsh.
- **Oh My Zsh**: Framework for managing Zsh configurations.

### For Bash
- **Bash**: Default shell on many Unix systems.
- **Bash Completion** (optional but recommended): Enhances command auto-completion.

## Installation

1. **Install Shell and Completion Tools**:

   - For **Zsh**: Install Zsh and Oh My Zsh.
     - For **Ubuntu/Debian** systems:

       ```bash
       sudo apt install zsh
       chsh -s $(which zsh)
       sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       ```

     - **Note**: Zsh uses a `.zshrc` configuration file located in your home directory to customize your environment.

   - For **Bash**: Install Bash Completion.
     - For **Ubuntu/Debian** systems:

       ```bash
       sudo apt install bash-completion
       ```

     - **Note**: Bash uses a `.bashrc` file for customizations.

2. **Clone the Repository**:

   Download this repository by running:

   ```bash
   git clone https://github.com/thedudemanz/custom-terminal-setup.git

3. **Copy the Configuration File**:

   - For **Zsh**:

     ```bash
     cp custom-terminal-setup/.zshrc ~/.zshrc
     ```

   - For **Bash**:

     ```bash
     cp custom-terminal-setup/.bashrc ~/.bashrc
     ```

4. **Install Plugins (Zsh only)**:

   To enable auto-suggestions and syntax highlighting, you need to install the following plugins:

   - **Zsh Syntax Highlighting**:

     ```bash
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     ```

   - **Zsh Auto-Suggestions**:

     ```bash
     git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     ```

5. **Source the Configuration File**:

   After copying the configuration file, you need to source it to apply the changes:

   - **For Zsh**:
     ```bash
     source ~/.zshrc
     ```

   - **For Bash**:
     ```bash
     source ~/.bashrc
     ```

6. **Edit the Configuration File**:

   To modify aliases, functions, or customize the prompt further, open the configuration file using any text editor:

   - **For Zsh**:
     ```bash
     nano ~/.zshrc
     ```

   - **For Bash**:
     ```bash
     nano ~/.bashrc
     ```

## Aliases and Shortcuts

This setup includes several predefined aliases and shortcuts for ease of use. Below are the available shortcuts, along with their respective commands and descriptions.

### Common Aliases for **Zsh** and **Bash**

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

These aliases can be found and customized in both `.zshrc` (for Zsh) and `.bashrc` (for Bash).

## Additional Shortcuts

In addition to the common shortcuts, we provide additional shortcuts to streamline file management, system commands, and other everyday tasks. These shortcuts work for both **Zsh** and **Bash**.

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

We provide shortcuts for commonly used Git commands to simplify the workflow for both **Zsh** and **Bash** users. Below are the shortcuts and their respective commands:

- **`gs`**: `git status 2>/dev/null || echo "Not inside a Git repository!"` (Check the status of the Git repository).
- **`ga`**: `git add .` (Stage all files for commit).
- **`gc`**: `git commit -m` (Commit staged changes with a message).
- **`gco`**: `git checkout` (Switch branches or restore working tree files).
- **`gp`**: `git push` (Push commits to the remote repository).
- **`gpo`**: `git push origin $(git rev-parse --abbrev-ref HEAD)` (Push the current branch to the origin).
- **`gl`**: `git log --oneline --graph --decorate --all` (View a compact log of commits, with decoration and graph).

## System Information

Upon starting the terminal, both **Zsh** and **Bash** users will see important system information displayed, including:

- **Uptime** of the system.
- **Memory Usage** and **Disk Usage**.
- **IP Address** of the machine.
- **Battery Status** (for laptops, if applicable).

This information is automatically displayed to help you monitor the system health at a glance.

## Custom Functions

The setup provides several custom functions for common tasks, making your terminal experience more efficient. Below are the custom functions included for both **Zsh** and **Bash**:

### Quick Project Navigation

- **`proj [name]`**: Quickly navigate to a pre-defined project directory.
- **`mkproj [name]`**: Create a new project folder and navigate into it.

These commands are designed to simplify project navigation and management.

### Resource Monitoring

- **`resources`**: Displays active processes, sorted by memory usage, allowing you to see what's consuming the most memory.
- **`resource_alert`**: Monitors CPU and memory usage, sending alerts if specified thresholds are crossed. This helps keep your system in good health without manual checks.

### TODO List

- **`todo add [task]`**: Adds a task to your TODO list, saving it in a file.
- **`todo list`**: Views all the tasks currently in the TODO list.
- **`todo clear`**: Clears all tasks from the TODO list.

These commands are especially useful for keeping track of tasks directly in your terminal environment.

### Cheatsheet

- **`cheatsheet`**: Generates and opens a markdown file with all your current aliases and shortcuts for easy reference.

This command provides a helpful summary of all custom shortcuts and aliases, making it easier to remember and use them effectively.

## Contributing

Feel free to fork this repository, make improvements, and open a pull request! Contributions are always welcome.

If you have suggestions for new features, bug fixes, or general improvements, please do not hesitate to share them. Collaboration helps make this terminal setup even better for everyone.

---

### Author

Created and maintained by **[tdmz](https://github.com/thedudemanz)**.

# Changelog

All notable changes to this project will be documented in this file.

## [1.2.0] - 2024-10-12

### Added
- Installation instructions for **Bash** users, including setup for programmable completion.
- Detailed explanation of the differences between `.zshrc` and `.bashrc` configuration files.
- Added system health monitoring function (`syshealth`) to display CPU load, memory usage, and disk usage.
- Included VS Code integration command (`codep`) for quick project navigation and opening in Visual Studio Code.
- Added a custom function (`battery_status`) to display battery status information for laptops.

### Changed
- Enhanced `.bashrc` and `.zshrc` templates to include more user-friendly comments and documentation.
- Updated the `README.md` to provide a clear distinction between Zsh and Bash setup procedures.
- Modified the prompt to show additional network information and timestamps.

### Fixed
- Fixed issues with Git branch detection in the `.bashrc` and `.zshrc` files.
- Corrected the file path for custom plugins in the Zsh setup instructions.

------------------------------------------------------------------------------------------------------------------------

## [1.1.0] - 2024-10-11

### Added
- Uploaded `README.md` with detailed instructions on how to set up the terminal environment.
- Included a structured guide on installing Zsh, Oh My Zsh, and Bash Completion.
- Added detailed list of aliases and shortcuts, including Git, Docker, Kubernetes, and file management.
- Provided system information display upon terminal startup (uptime, memory, disk usage, IP).
- Uploaded `.zshrc` and `.bashrc` templates with custom configurations for prompt, shortcuts, and functions.
- Added instructions for creating a Python virtual environment and activating it.
- Provided custom functions for project navigation, resource monitoring, and TODO list creation.
- Included error notifications for high CPU or memory usage.
- Added a command to generate a cheatsheet listing all aliases and shortcuts.

### Changed
- Updated initial `README.md` to include step-by-step instructions for setting up the environment from scratch.
- Adjusted `.zshrc` and `.bashrc` configurations for improved readability and functionality.

### Fixed
- Addressed formatting issues in the `README.md` file to ensure Markdown compatibility.
- Resolved syntax errors in the `.zshrc` and `.bashrc` files related to plugin installation paths.

------------------------------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------------------

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the following resources and contributors that helped inspire and develop this terminal setup:

- **Oh My Zsh**: For providing an incredible framework for managing Zsh configurations.
- **Zsh Syntax Highlighting & Auto-Suggestions**: For improving the terminal experience with helpful visual cues and suggestions.
- **Powerlevel10k**: For an outstanding customizable prompt theme.
- **Bash Completion**: For enhancing the usability of the Bash shell with programmable completion.

Feel free to use, modify, and share this setup. If you have any suggestions for improvement, open a pull request or issue!

------------------------------------------------------------------------------------------------------------------------

# Contributing

We appreciate and welcome contributions to the **Custom Terminal Setup** project! By improving this setup, we can make it more efficient and productive for everyone. Here are some ways you can contribute:

## How to Contribute

1. **Fork the Repository**: Start by forking this repository so you can make your changes without affecting the original codebase.

2. **Create a Branch**: Create a new branch in your forked repository for the changes you plan to make. Naming the branch after the feature or bug fix is a good practice.

   ```bash
   git checkout -b feature-new-alias
   ```

3. **Make Your Changes**: Make your edits in your preferred text editor. This could be adding new aliases, updating the documentation, fixing a bug, or adding new features.

4. **Test Your Changes**: Ensure that any code or configuration changes you make work correctly by testing in your local environment. Make sure the terminal functions properly after the changes.

5. **Commit Your Changes**: Once you've made your changes, commit them to your branch with a descriptive message.

   ```bash
   git add .
   git commit -m "Added a new alias for Docker cleanup"
   ```

6. **Push Changes**: Push your changes to your forked repository.

   ```bash
   git push origin feature-new-alias
   ```

7. **Open a Pull Request**: Go to the original repository and open a pull request. Include a detailed description of what changes you've made and why they are important. 

## Contribution Guidelines

- **Documentation**: Ensure that any changes to functionality are also reflected in the documentation (README.md).
- **Code Quality**: Maintain the same style of code formatting and commenting as the existing codebase.
- **Testing**: Please ensure that your changes do not break any existing functionality. Test thoroughly before submitting your pull request.
- **Commits**: Write clear, concise commit messages that describe the changes made.

By contributing, you are helping make this tool better for others, and we thank you for that!

------------------------------------------------------------------------------------------------------------------------

# Author

This project is created and maintained by **[tdmz](https://github.com/thedudemanz)**.

Feel free to reach out via GitHub for any questions, suggestions, or discussions about this project. Your feedback and contributions are always welcome!

---

# Changelog

All notable changes to this project will be documented in this file.

## [1.2.0] - 2024-10-12

### Added
- Bash Installation: Added instructions for Bash users.
- System Health Monitoring: Added `syshealth` function for monitoring system health.
- VS Code Integration: Added a command to quickly open projects in VS Code.

### Changed
- Configuration Files: Enhanced `.bashrc` and `.zshrc` templates.
- README: Updated to clearly distinguish Zsh and Bash steps.
- Prompt: Updated to include timestamps and network info.

## [1.1.0] - 2024-10-11

### Added
- `README.md`: Detailed setup instructions.
- Configuration Files: Added `.zshrc` and `.bashrc` templates.
- Aliases: Git, Docker, Kubernetes shortcuts.
- System Info Display: Showed uptime, memory, and disk usage.
- Custom Functions: Project navigation, TODO list, resource monitoring.

### Changed
- Updated instructions to be more beginner-friendly.

### Fixed
- Formatting issues in `README.md`.
- Syntax errors in `.zshrc` and `.bashrc`.

## [1.0.0] - 2024-10-10

### Added
- Initial Release: Basic terminal setup for Zsh.
- Git Integration: Added Git shortcuts.
- System Info Display: Display basic system information.

