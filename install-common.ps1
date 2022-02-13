# Install Chocolatey
Set-ExecutionPolicy Bypass
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop;

choco install -y insomnia-rest-api-client
# Install nvm from https://github.com/coreybutler/nvm-windows/releases
choco install -y jetbrainstoolbox
choco install -y git.install --params '"/GitOnlyOnPath /NoShellIntegration"'    
choco install -y php --params '"/ThreadSafe /InstallDir:C:\PHP"'
# Don't forget to enable PHP extensions: curl, dom, exif, fileinfo, gd, intl, json, mysqli, pdo_mysql, pdo_pgsql, pdo_sqlite
# Install xdebug. Settings:
# zend_extension = php_xdebug-3.1.2-8.1-vs16-x86_64.dll
# xdebug.mode = coverage;
# openssl and mbstring may already be enabled

choco install -y composer ngrok
# Composer is upgraded by running composer self-update
choco pin add --name composer
choco install -y apache-httpd --params '"/installLocation:C:\Apache"'

msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

# Install WinCompose http://wincompose.info/

# Install Ruby
