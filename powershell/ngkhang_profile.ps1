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
