$ErrorActionPreference = "Stop"

$_configDir = Join-Path $env:DOTFILES_DIR "windows"

[Environment]::SetEnvironmentVariable("CONFIG_DIR", $_configDir, "User")
$env:CONFIG_DIR = $_configDir

Link-File `
    (Join-Path $env:DOTFILES_DIR "git\gitconfig") `
    (Join-Path $HOME ".gitconfig")

Link-File `
    (Join-Path $_configDir "Microsoft.PowerShell_profile.ps1") `
    $PROFILE

& (Join-Path $_configDir "install\install.ps1")