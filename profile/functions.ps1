# Add a new entry to virtual hosts file
function global:Add-VHost ([String] $host) {
    Add-Content -Path $env:windir\system32\drivers\etc\hosts -Value $host
}

function global:Enter-NewDirectory([String] $path) {
    New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; 
    Set-Location $path
}

# ~: Go Home
function global:~ { Set-Location ~ }

function global:Set-LocationToParent { Set-Location .. };

function global:Create-File ([String] $file) {
    "" | Out-File $file
}

function global:GoTo-ProjectsFolder { Set-Location D:\Projects }

function global:Add-EnvPath([String] $path) { 
    if (!(Test-Path $path)) { 
        Write-Error -Message "The specified path does not exist"
        break 1
    }
    $env:PATH = $env:PATH + ";$path"
}

function global:Run-Apache ([switch] $Start, [switch] $Stop, [switch] $Restart) {
    if ($Start) {
        Start-Service -Name "Apache"
    }
    elseif ($Stop) {
        Stop-Service -Name "Apache"
    }
    elseif ($Restart) {
        Restart-Service -Name "Apache"
    }
}

function global:Run-MySQL ([switch] $Start, [switch] $Stop, [switch] $Restart) {
    if ($Start) {
        Start-Service -Name "MySQL80"
    }
    elseif ($Stop) {
        Stop-Service -Name "MySQL80"
    }
    elseif ($Restart) {
        Restart-Service -Name "MySQL80"
    }
}

function global:Run-Redis ([switch] $Start, [switch] $Stop) {
    if ($Start) {
        docker run --name redis -d -p 6379:6379 redis
    }
    elseif ($Stop) {
        docker rm (docker ps  -f name=redis -q) -f 
    }
}

function global:Start-Apache {
    Run-Apache -Start
}


function global:Start-MySQL {
    Run-MySQL -Start
}

function global:Start-Redis {
    Run-Redis -Start
}
function global:Enter-RedisCli ([string] $RedisHost = "localhost", [string] $RedisPort = "6379") {
    docker run -it --rm redis redis-cli -h "$RedisHost" -p $RedisPort
}
