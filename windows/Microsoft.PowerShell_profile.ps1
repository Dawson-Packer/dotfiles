
. (Join-Path $env:CONFIG_DIR "common\aliases.ps1")
. (Join-Path $env:CONFIG_DIR "common\functions.ps1")
. (Join-Path $env:CONFIG_DIR "common\paths.ps1")

Set-PSReadLineKeyHandler -Chord 'Shift+Tab' -Function ForwardChar