@echo off
setlocal

set /p game_path=<settings/game_path.txt

start %game_path%
cd git
powershell.exe -ExecutionPolicy Bypass -File setup_git.ps1
powershell.exe -ExecutionPolicy Bypass -File git_pull.ps1
cd ..
timeout /t 10 /nobreak
powershell.exe -ExecutionPolicy Bypass -File "monitor.ps1"