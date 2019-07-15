# Uninstall the crap that comes with Windows
.\uninstall.ps1

# Install my own crap
.\install-personal.ps1

# Install dev tools
.\install-dev.ps1

# Configure my dev stuff
.\configure-dev.ps1

# Configure other stuff
.\configure.ps1

# Set up profile
Copy-Item -Path ".\profile\*" -Destination "C:\Users\shalvah\Documents\WindowsPowerShell"
