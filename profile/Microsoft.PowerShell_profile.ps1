Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Honukai

# Complete from history whe you type some text and press Up arrow
Set-PSReadlineKeyHandler -Chord UpArrow -Function HistorySearchBackward
# More sensible tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Make Get-History return persistent history
$MaximumHistoryCount = 500
$HistoryPath = Join-Path (split-path $profile) history.clixml

# Hook powershell's exiting event & hide the registration with -supportevent (from nivot.org)
Register-EngineEvent -SourceIdentifier powershell.exiting -SupportEvent -Action {
      Get-History | Export-Clixml $HistoryPath
}.GetNewClosure()

# Load previous history, if it exists
if ((Test-Path $HistoryPath)) {
    Import-Clixml $HistoryPath | ? {$count++; $true} | Add-History
    Write-Host -Fore Green "`nLoaded $count history item(s).`n"
}
Remove-Variable HistoryPath
Remove-Variable MaximumHistoryCount

Invoke-Expression "$PSScriptRoot\functions.ps1"
Invoke-Expression "$PSScriptRoot\aliases.ps1"