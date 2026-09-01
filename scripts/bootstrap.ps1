$ErrorActionPreference = "Stop"

$_dotfilesDir = Split-Path -Parent $PSScriptRoot

[Environment]::SetEnvironmentVariable("DOTFILES_DIR", $_dotfilesDir, "User") 
$env:DOTFILES_DIR = $_dotfilesDir

function Link-File {
    param (
        [Parameter()]
        [string]$Source,

        [Parameter()]
        [string]$Target
    )

    Write-Host "Linking $Target → $Source"

    $Parent = Split-Path -Parent $Target

    if ($Parent -and -not (Test-Path $Parent)) {
        New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    }

    if (Test-Path $Target) {
        Remove-Item $Target -Force
    }

    New-Item `
        -ItemType SymbolicLink `
        -Path $Target `
        -Target $Source | Out-Null
}

& "$_dotfilesDir\windows\init.ps1"

Write-Host "Done. Successfully initialized dotfiles for Windows. Restart your shell to apply changes."