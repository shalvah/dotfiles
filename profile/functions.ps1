# Add a new entry to virtual hosts file
function global:Add-VHost ([String] $NewHostName) {
    Add-Content -Path $env:windir\system32\drivers\etc\hosts -Value "127.0.0.1 $NewHostName"
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

function global:GoTo-ProjectsFolder ([String] $path) {
    $ProjectsPath = if ($null -eq $env:ProjectsPath) { "C:\Users\shalvah\Projects" } else { $env:ProjectsPath };

    if ($null -eq $path) {
        Set-Location $ProjectsPath
    }
    elseif ($path -eq "ls") {
        Get-ChildItem $ProjectsPath\*\*
    }
    else {
        Set-Location "$ProjectsPath\$path"
    }
}

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
        docker run --name redis -d -p 6379:6379 -v $env:DockerVolumes/redis/data:/data redis redis-server --appendonly yes
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
function global:Enter-RedisCli ([string] $RedisHost = "localhost", [string] $RedisPort = "6379", [string] $Extra = "") {
    docker run -it --rm redis redis-cli -h "$RedisHost" -p $RedisPort $Extra
}

function global:Sync-Profile {
    Copy-Item ~\dotfiles\profile\* ~\Documents\WindowsPowerShell\
}

# Start up containers for EKA (Elasticsearch-Kibana-APM server)
function global:Start-EKA {
    $composeFilePath = Resolve-Path "~\dotfiles\extras\eka.docker-compose.yml"
    docker-compose -f $composeFilePath.Path --project-name eka up -d
}

function global:Kill-DockerContainers {
    docker rm (docker ps -aq) -f
}

function global:Update-Nodejs ([string] $Version = "latest", [switch] $WithExtraPackages) {
    nvm install $Version
    nvm use $Version
    npm install -g cross-env 
    
    if ($WithExtraPackages) {
        npm i -g serverless express-generator
    }
}