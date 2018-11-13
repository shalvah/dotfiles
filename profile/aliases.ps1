# easier navigation

# ~: Go Home
function global:~ { Set-Location ~ }

# ..: Go up
# PoSh won't allow function .. {} because of an invalid function name, so...
function global:Set-ParentLocation { Set-Location .. };
Set-Alias ".." Set-ParentLocation -Scope Global

# mkd: create directory and enter it
Set-Alias mkd Enter-NewDirectory -Scope Global

function global:GoTo-ProjectsFolder { Set-Location ~\Projects }
Set-Alias proj global:GoTo-ProjectsFolder -Scope Global