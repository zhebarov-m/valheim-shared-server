$gitRepository = Get-Content "..\settings\game_servers_path.txt"
$githubRepository = Get-Content "..\settings\github.txt"

if (-not (Test-Path -Path "$gitRepository\.git\HEAD")) {
    git -C $gitRepository init
    git -C $gitRepository remote add origin "$githubRepository"
}

$git_username = ""
if (-not $git_username) {
    $git_username = $env:USERNAME
}

$git_email = ""
if (-not $git_email) {
    $git_email = "$env:USERNAME@example.com"
}

git -C $gitRepository config user.name "$git_username"
git -C $gitRepository config user.email "$git_email"