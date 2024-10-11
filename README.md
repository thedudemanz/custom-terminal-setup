# Custom Terminal Setup

Welcome to the **Custom Terminal Setup** project! This setup customizes your terminal environment with various helpful features, making it more productive and personalized.

## Features

- **Custom Zsh prompt** with username, hostname, current directory, Git branch, and timestamp.
- **Git integration** with helpful Git shortcuts.
- **System Information**: Displays uptime, memory usage, disk usage, and IP address on terminal startup.
- **Auto-completion and suggestions** for commands and aliases.
- **Aliases for quick navigation and common commands**.
- **Kubernetes and Docker command shortcuts** for faster workflow.
  
## Installation

To use this custom terminal setup, follow the steps below:

1. **Clone this repository**:
    ```bash
    git clone https://github.com/thedudemanz/custom-terminal-setup.git
    ```

2. **Navigate to the repository folder**:
    ```bash
    cd custom-terminal-setup
    ```

3. **Copy the `.zshrc` file** to your home directory:
    ```bash
    cp .zshrc ~/.zshrc
    ```

4. **Install necessary plugins**:
    - For Zsh syntax highlighting:
      ```bash
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
      ```
    - For Zsh auto-suggestions:
      ```bash
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      ```

5. **Reload the terminal** or source the `.zshrc` file:
    ```bash
    source ~/.zshrc
    ```

## Aliases and Shortcuts

Here are some of the available shortcuts and what they do:

- `ll`: List files in long format, including hidden files.
- `gs`: Git status.
- `ga`: Git add all changes.
- `gc`: Git commit with a message.
- `gco`: Git checkout.
- `gp`: Git push.
- `gpo`: Git push to origin, current branch.
- `k`: Kubernetes command shortcut (`kubectl`).
- `dps`: Show active Docker containers.
- `venv`: Create a Python virtual environment in `.venv` and activate it.

## Git Shortcuts

- **Git Status (`gs`)**: Quickly check the status of your repository.
- **Git Add (`ga`)**: Stage all files for commit.
- **Git Commit (`gc`)**: Commit staged changes with a message.
- **Git Push (`gp`)**: Push commits to the remote repository.

## System Information

Upon starting the terminal, you’ll see:

- Uptime of the system.
- Memory and disk usage.
- IP address.

## Contributing

Feel free to fork this repository, make improvements, and open a pull request! Contributions are always welcome.

---

### Author

Created and maintained by **[tdmz](https://github.com/thedudemanz)**.
