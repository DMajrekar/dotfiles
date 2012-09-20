on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

if appIsRunning("iTunes") then
	tell application "iTunes" to if player state is playing then "Now Playing: " & name of current track & " - " & artist of current track
else if appIsRunning("Radium") then
	tell application "Radium"
		if playing of player then
			channel name of player & ": " & song title of player
		end if
	end tell
end if
