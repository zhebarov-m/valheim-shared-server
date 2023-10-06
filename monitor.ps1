$folderToMonitor = Get-Content ".\settings\game_servers_path.txt"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderToMonitor
$watcher.IncludeSubdirectories = $false
$watcher.Filter = "*.db"

cd .\git

$action = { & ".\git_push.ps1" }

Register-ObjectEvent $watcher -EventName Created -Action $action
Register-ObjectEvent $watcher -EventName Deleted -Action $action
Register-ObjectEvent $watcher -EventName Changed -Action $action
Register-ObjectEvent $watcher -EventName Renamed -Action $action

$processName = "valheim"
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

while($true) {
if ($process -ne $null -and $process.HasExited -eq $true) {
	Exit
}
    Start-Sleep -Seconds 3
}