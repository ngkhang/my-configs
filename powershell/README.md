# Terminal and PowerShell Setup

- [Terminal and PowerShell Setup](#terminal-and-powershell-setup)
  - [Windows Terminal](#windows-terminal)
    - [Installation](#installation)
    - [Configuration](#configuration)
  - [PowerShell v7](#powershell-v7)
    - [Installation](#installation-1)
    - [Profile Configuration](#profile-configuration)

## Windows Terminal

### Installation

1. Install from Microsoft Store (recommended) or download from [GitHub releases](https://github.com/microsoft/terminal/releases)
2. Install a Nerd Font from [Nerd Fonts](https://www.nerdfonts.com/font-downloads). My settings use FiraCode or JetBrainsMono [metadata/fonts](../metadata/fonts/)

### Configuration

1. Open Windows Terminal -> Settings (`Ctrl+,`) -> Open JSON file
2. Add custom color scheme to schemes array:

   ```json
   {
     "schemes": [
       {
         "name": "One Half Dark (Custom)",
         "background": "#001B26",
         "black": "#282C34",
         "blue": "#61AFEF",
         "brightBlack": "#5A6374",
         "brightBlue": "#61AFEF",
         "brightCyan": "#56B6C2",
         "brightGreen": "#98C379",
         "brightPurple": "#C678DD",
         "brightRed": "#E06C75",
         "brightWhite": "#DCDFE4",
         "brightYellow": "#E5C07B",
         "cursorColor": "#FFFFFF",
         "cyan": "#56B6C2",
         "foreground": "#DCDFE4",
         "green": "#98C379",
         "purple": "#C678DD",
         "red": "#E06C75",
         "selectionBackground": "#FFFFFF",
         "white": "#DCDFE4",
         "yellow": "#E5C07B"
       }
     ]
   }
   ```

3. Apply font and color scheme to default profile:

   ```json
   {
     "profiles": {
       "defaults": {
         "colorScheme": "One Half Dark (Custom)",
         "font": {
           "face": "FiraCode Nerd Font"
         }
       }
     }
   }
   ```

**Alternative**: Copy properties from [`terminal.settings.json`](./terminal.settings.json) to your Windows Terminal settings file.

## PowerShell v7

PowerShell 7.5+ provides modern syntax, better performance, and cross-platform features compared to Windows PowerShell 5.1.

### Installation

- Reference: [Install PowerShell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows?view=powershell-7.5)

1. Install using WinGet

   ```powershell
   # Search for the latest version of PowerShell
   winget search --id Microsoft.PowerShell

   # Install PowerShell using the --id parameter
   winget install --id Microsoft.PowerShell --source winget
   ```

2. Restart Windows Terminal after installation
3. Set as Default: Open Windows Terminal -> Settings -> Startup -> Set Default profile to PowerShell (the one showing version 7.x)

### Profile Configuration

This setup uses a custom config directory (`$env:USERPROFILE\.config\powershell`) instead of the default Documents location for better organization.

1. Check your profile paths:

   ```powershell
   # Your user profile directory
   $env:USERPROFILE

   # PowerShell 7 profile location
   $PROFILE.CurrentUserCurrentHost
   # Should show: C:\Users\USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
   ```

2. Create custom config directory:

   ```powershell
   mkdir -p $env:USERPROFILE\.config\powershell
   ```

3. Create your custom profile (`ngkhang_profile.ps1`) in `.config\powershell`:

   ```powershell
   # Create the file
   New-Item -Path "$env:USERPROFILE\.config\powershell\ngkhang_profile.ps1" -ItemType File -Force

   # Edit it
   notepad "$env:USERPROFILE\.config\powershell\ngkhang_profile.ps1"
   ```

4. Add this content to `ngkhang_profile.ps1`

   ```powershell
    #========= Alias =========#
    Set-ALias g git

    #========== Utils Function  =========#
    <#
    .SYNOPSIS
        Creates a new file or opens existing file
    .DESCRIPTION
        If file doesn't exist, creates it. If file exists, opens with default program.
    .PARAMETER file
        Path to the file
    .EXAMPLE
        touch myfile.txt
        Creates myfile.txt or opens it if already exists
    #>
    function touch {
      param($file)
      if (Test-Path $file) {
        Invoke-Item $file
      }
      else {
        New-Item -ItemType File -Path $file | Out-Null
        Write-Host "File created: $file" -ForegroundColor Green
      }
    }

    <#
    .SYNOPSIS
        Creates a new directory or opens existing file
    .DESCRIPTION
        If directory doesn't exist, creates it. If file exists, return message: "Directory '$dir' already exists"
    .PARAMETER dir
        Path to the directory
    .EXAMPLE
        mkcd MyFolder
        "Directory created"
    .EXAMPLE
        mkcd MyFolder
        "Directory 'MyFolder' already exists"
    #>
    function mkcd {
      param($dir)

      if (Test-Path $dir) {
        Write-Host "Directory '$dir' already exists" -ForegroundColor Yellow
        return
      }

      New-Item -ItemType Directory -Path $dir -Force | Out-Null
      Write-Host "Directory created" -ForegroundColor Green
    }

    <#
    .SYNOPSIS
        Locates a command and returns its path
    .DESCRIPTION
        Locates a command and returns its path
    .PARAMETER command
        Name of the command
    .EXAMPLE
        which git
        C:\Program Files\Git\cmd\git.exe
    #>
    function which ($command) {
      Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
    }

    <#
    .SYNOPSIS
        Lists files and directories in wide format
    .PARAMETER args
        Additional arguments to pass to Get-ChildItem
    .EXAMPLE
        ll
        Lists all files and directories in the current directory in wide format
    .EXAMPLE
        ll -Path . -Recurse
        Lists all files and directories in the current directory and its subdirectories in wide format
    #>
    function ll { Get-ChildItem @args | Format-Wide -AutoSize }

    <#
    .SYNOPSIS
        Lists files and directories including hidden ones
    .PARAMETER args
        Additional arguments to pass to Get-ChildItem
    .EXAMPLE
        la
        Lists all files and directories in the current directory including hidden ones
    .EXAMPLE
        la -Path . -Recurse
        Lists all files and directories in the current directory and its subdirectories including hidden ones
    #>
    function la { Get-ChildItem -Force @args }
   ```

5. Create the PowerShell 7 profile in Documents and source your custom profile:

   ```powershell
   # Create profile if it doesn't exist
   if (!(Test-Path -Path $PROFILE.CurrentUserCurrentHost)) {
       New-Item -Path $PROFILE.CurrentUserCurrentHost -ItemType File -Force
   }

   # Add source line to the profile
   Add-Content -Path $PROFILE.CurrentUserCurrentHost -Value ". `$env:USERPROFILE\.config\powershell\ngkhang_profile.ps1"
   ```

6. Reload your profile

   ```powershell
   # Reload without restarting
   . $PROFILE

   # Or restart Windows Terminal
   ```
