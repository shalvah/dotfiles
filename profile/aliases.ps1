# easier navigation

# ..: Go up
# PoSh won't allow function .. {} (invalid function name), so...
Set-Alias ".." Set-LocationToParent -Scope Global

# mkcd: create directory and enter it
Set-Alias mkcd Enter-NewDirectory -Scope Global

Set-Alias touch Create-File -Scope Global

Set-Alias grep Select-String -Scope Global

Set-Alias proj GoTo-ProjectsFolder -Scope Global

Set-Alias redis Start-Redis -Scope Global

Set-Alias mysql Start-MySQL -Scope Global

Set-Alias apache Start-Apache -Scope Global

Set-Alias redis-cli Enter-RedisCli -Scope Global

if (Get-Command serverless -ErrorAction SilentlyContinue) {
    Set-Alias -Name sls -Value serverless -Option AllScope -Scope Global
}