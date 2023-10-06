$gitRepository = Get-Content "..\settings\game_servers_path.txt"

git -C "$gitRepository" fetch origin master
git -C "$gitRepository" reset --hard origin/master