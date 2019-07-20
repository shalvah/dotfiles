# Install Chocolatey
Set-ExecutionPolicy Bypass
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop;
$env:PATH = $env:PATH + ";$env:ALLUSERSPROFILE\chocolatey\bin"

choco install -y postman nvm.portable insomnia-rest-api-client
choco install -y jetbrainstoolbox
choco install -y git.install --params '"/GitOnlyOnPath /NoShellIntegration"'    
choco install -y php --params '"/ThreadSafe /InstallDir:C:\PHP"'
# Exclude PHP from auto upgrades
choco pin add --name php
choco install -y composer ngrok
# Composer is upgraded by running composer self-update
choco pin add --name composer
choco install -y apache-httpd --params '"/installLocation:C:\Apache"'

# Install VS Code (and sync extensions) manually