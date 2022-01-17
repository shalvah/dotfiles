# Install Chocolatey
Set-ExecutionPolicy Bypass
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop;

choco install -y nvm.portable insomnia-rest-api-client
choco install -y jetbrainstoolbox
choco install -y git.install --params '"/GitOnlyOnPath /NoShellIntegration"'    
choco install -y php --params '"/ThreadSafe /InstallDir:C:\PHP"'
# Don't forget to enable PHP extensions: curl, dom, exif, fileinfo, gd, intl, json, mysqli, pdo_mysql, pdo_pgsql, pdo_sqlite
# Install redis, xdebug
# openssl and mbstring may already be enabled

choco install -y composer ngrok
# Composer is upgraded by running composer self-update
choco pin add --name composer
choco install -y apache-httpd --params '"/installLocation:C:\Apache"'

msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

# Install WinCompose http://wincompose.info/
