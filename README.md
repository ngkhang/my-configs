# My Development Environment Configs 👋

This is my personal configuration for my tools using

- Test update git config global
- Test GPG key 10

- [My Development Environment Configs 👋](#my-development-environment-configs-)
  - [Prerequisites](#prerequisites)
  - [Quick Start](#quick-start)
  - [What's Includes](#whats-includes)
    - [PowerShell \& Terminal](#powershell--terminal)
  - [Installation](#installation)
  - [Project Structure](#project-structure)
  - [Credits](#credits)
  - [About Me](#about-me)
  - [Show your support](#show-your-support)

## Prerequisites

- **OS**: Windows 10/11
- **Tools**:
  - PowerShell 7+
  - Git
  - Scoop package manager
- **Fonts**: Nerd Fonts (FiraCode or JetBrainsMono recommended)

## Quick Start

1. **Clone the repository**

   ```powershell
   # Clone this repository
   git clone https://github.com/ngkhang/my-configs.git
   cd my-configs
   ```

2. **Choose what to set up**
   - For Terminal/PowerShell: `cd powershell` → See [README.md](./powershell/README.md)

3. **Follow the step-by-step guide** in each `README.md` file

## What's Includes

### PowerShell & Terminal

- Windows Terminal and PowerShell 7 configuration for development.
- 📁 [Complete Setup Guide](./powershell/README.md)
- **Features:**
  - **PowerShell 7** with custom profile
  - **Windows Terminal** customization
  - **Oh My Posh** - Custom prompt
  - **Terminal-Icons** - File and folder icons
  - **PSReadLine** - Intelligent command prediction and history
  - **fzf** - Fuzzy search for files and command history
  - **z** - Fast directory navigation based on frequency
  - **Posh-Git** - Enhanced git integration
  - **Custom utilities** - Unix-like commands (touch, which, ll, la, mkcd)

## Installation

Each configuration has its own setup guide:

1. Terminal & PowerShell: [./powershell/README.md](./powershell/README.md)

## Project Structure

```md
.
├── metadata/
│   └── fonts # Nerd Fonts
│
├── powershell # Terminal and PowerShell configs/
│   ├── README.md # Setup instructions
│   ├── ngkhang_profile.ps1 # Custom profile
│   ├── ngkhang.omp.json # Oh My Posh theme
│   └── terminal.settings.json # Terminal settings
│
└── README.md
```

## Credits

- [Windows Terminal](https://github.com/microsoft/terminal)
- [PSReadLine](https://github.com/PowerShell/PSReadLine)
- [fzf](https://github.com/junegunn/fzf) and [PSFzf](https://github.com/kelleyma49/PSFzf)
- [Oh My Posh](https://ohmyposh.dev/)
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)
- [Z](https://www.powershellgallery.com/packages/z)
- [Posh-Git](https://github.com/dahlbyk/posh-git)

## About Me

- [GitHub: @ngkhang](https://github.com/ngkhang/)

## Show your support

Give a ⭐ if this project helped you!
