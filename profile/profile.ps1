Import-Module posh-git

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\Honukai.omp.json" | Invoke-Expression

# Complete from history whe you type some text and press Up arrow
Set-PSReadlineKeyHandler -Chord UpArrow -Function HistorySearchBackward
# More sensible tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

Invoke-Expression "$PSScriptRoot\functions.ps1"
Invoke-Expression "$PSScriptRoot\aliases.ps1"
if (Test-Path -Path "$PSScriptRoot\custom.ps1") {
    Invoke-Expression "$PSScriptRoot\custom.ps1"
}
