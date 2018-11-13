# Add a new entry to virtual hosts file
function global:Add-VHost ([String] $host) {
    Add-Content -Path $env:windir\system32\drivers\etc\hosts -Value $host
}

function global:Enter-NewDirectory([String] $path) {
    New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; 
    Set-Location $path
}

function global:Create-File ([String] $file) {
    "" | Out-File $file
}

function global:Add-EnvPath([String] $path) { 
    if (!(Test-Path $path)) { 
        Write-Error -Message "The specified path does not exist"
        break 1
    }
    $env:PATH = $env:PATH + ";$path"
}

function global:Start-Apache {
    Start-Service -Name "Apache"
}

function global:Start-MySQL {
    Start-Service -Name "MySQL80"
}

