# Install Chocolatey
Set-ExecutionPolicy Bypass
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop;
$env:PATH = $env:PATH + ";$env:ALLUSERSPROFILE\chocolatey\bin"

# Utilities
choco install -y vlc 7zip f.lux GoogleChrome screentogif
choco install -y google-backup-and-sync --ignore-checksums

choco install -y origin steam
choco install -y activepresenter
# Install manually:
# Redis on Windows, Redis Desktop Manager, Unified Remote, FDM, VSCode, MySQL 8, Docker for Windows
# Port game data (FIFA, GTA)
# Port IDE and VsCode setttings
