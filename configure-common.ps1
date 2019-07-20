# Default to latest Node.js LTS
nvm on
$nodeLtsVersion = choco search nodejs-lts --limit-output | ConvertFrom-String -TemplateContent "{Name:package-name}\|{Version:1.11.1}" | Select -ExpandProperty "Version"
nvm install $nodeLtsVersion
nvm use $nodeLtsVersion
Remove-Variable nodeLtsVersion

### Node Packages
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
npm install -g serverless express-generator cross-env
npm update npm

composer global require hirak/prestissimo
composer global require psy/psysh

$env:EDITOR = "code"
$env:GIT_EDITOR = $env:EDITOR

choco install -y cmder
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
Set-Location fonts
.\install.ps1
Set-Location ..
Remove-Item -Path fonts -Recurse

# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1
# Bash on Windows
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null
