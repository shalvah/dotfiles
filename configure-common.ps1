# Default to latest Node.js LTS
nvm on
$nodeLtsVersion = "16.14.0"
nvm install $nodeLtsVersion
nvm use $nodeLtsVersion
Remove-Variable nodeLtsVersion

### Node Packages
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
npm install -g cross-env yarn serverless redis-commander
npm update npm

composer global require psy/psysh

# May need to set these manually
setx EDITOR "code --wait" /m
setx GIT_EDITOR "code --wait" /m

choco install -y cmder
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
Set-Location fonts
.\install.ps1
Set-Location ..
Remove-Item -Path fonts -Recurse -Force

# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1
# Bash on Windows
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null
