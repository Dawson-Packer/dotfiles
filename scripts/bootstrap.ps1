param {
    [Parameter(Mandatory)]
    [ValidateSet("windows")]
    [string]$OSName
}

$ErrorActionPreferences = "Stop"

$DotfilesDir = Split-Path -Parent $PSScriptRoot

function Link-File {
    param (
        [Parameter[Mandatory]]
        [string]$Source,

        [Parameter(Mandatory)]
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

switch ($OSName) {
    "windows" {
        & "$DotfilesDir\windows\init.ps1" 
    }
}

Write-Host "Done. Successfully initialized dotfiles for Windows. Restart your shell to apply changes."