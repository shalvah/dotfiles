# Default to latest Node.js LTS
nvm on
nvm install lts
nvm use lts
Remove-Variable nodeLtsVersion

### Node Packages
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
npm install -g cross-env yarn serverless redis-commander
npm update npm

composer global require psy/psysh

# May need to set these manually
setx EDITOR "code --wait" /m
setx GIT_EDITOR "code --wait" /m

# install oh-my-posh and posh=git
Install-Module posh-git -Scope CurrentUser
winget install JanDeDobbeleer.OhMyPosh -s winget # see https://ohmyposh.dev/docs/installation/windows

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
Set-Location fonts
.\install.ps1
Set-Location ..
Remove-Item -Path fonts -Recurse -Force

# Set in Windows Registry (speed up Windows Explorer by telling it to treat all folders as generic)
# [HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell]
# "FolderType"="NotSpecified"

# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1
# WSL
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null
