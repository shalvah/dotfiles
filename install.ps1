# Install Chocolatey
Set-ExecutionPolicy Bypass
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
$env:PATH = $env:PATH + ";$env:ALLUSERSPROFILE\chocolatey\bin"

# Utilities
choco install -y vlc 7zip f.lux GoogleChrome screentogif

choco install -y postman nvm.portable
choco install -y jetbrainstoolbox
choco install -y git.install --params '"/GitOnlyOnPath /NoShellIntegration"'    
choco install -y php --params '"/ThreadSafe /InstallDir:C:\PHP"'
# Exclude PHP from auto upgrades
choco pin add --name php
choco install -y composer ngrok
choco install -y apache-httpd --params '"/installLocation:C:\Apache"'
# Composer is upgraded by running composer self-update
choco pin add --name composer

choco install -y origin steam
choco install -y activepresenter

# Install manually:
# Redis on Windows, Redis Desktop Manager, Unified Remote, FDM, VSCode, MySQL 8, Docker for Windows
# Port game data (FIFA, GTA)
# Port IDE and VsCode setttings
