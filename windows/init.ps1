$ErrorActionPreference = "Stop"

$ConfigDir = Join-Path $DotfilesDir "windows"

Link-File `
    (Join-Path $DotfilesDir "git\gitconfig") `
    (Join-Path $HOME ".gitconfig")

Link-File `
    (Join-Path $ConfigDir "Microsoft.PowerShell_profile.ps1") `
    $PROFILE

& (Join-Path $ConfigDir "install\install.ps1")