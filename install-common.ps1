# Install Chocolatey
Set-ExecutionPolicy Bypass
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop;
$env:PATH = $env:PATH + ";$env:ALLUSERSPROFILE\chocolatey\bin"

choco install -y postman nvm.portable insomnia-rest-api-client
choco install -y jetbrainstoolbox
choco install -y git.install --params '"/GitOnlyOnPath /NoShellIntegration"'    
choco install -y php --params '"/ThreadSafe /InstallDir:C:\PHP"'
# Exclude PHP from auto upgrades
choco pin add --name php
# DOn't forget to enable PHP extensions: curl, fileinfo, intl, mysqli, pdo_mysql, pdo_pgsql, pdo_sqlite
# openssl and mbstring may already be enabled

choco install -y composer ngrok
# Composer is upgraded by running composer self-update
choco pin add --name composer
choco install -y apache-httpd --params '"/installLocation:C:\Apache"'

choco install -y awscli

# Install VS Code (and sync extensions) manually
