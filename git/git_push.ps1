$gitRepository = Get-Content "..\settings\game_servers_path.txt"

git -C "$gitRepository" add .
git -C "$gitRepository" commit -m "Auto commit"
git -C "$gitRepository" push origin master