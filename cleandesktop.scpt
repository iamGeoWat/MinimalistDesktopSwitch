# toggle menu bar visibility
tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.dock"
end tell
delay 1
tell application "System Events"
	tell application process "System Preferences"
		tell window 1
			click checkbox 4
			click checkbox 7
		end tell
	end tell
end tell
if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if

#	# another way to reverse dock visibility
#	tell application "System Events"
#		tell dock preferences
#			if autohide is true then
#				set autohide to false
#			else
#				set autohide to true
#			end if
#		end tell
#	end tell

# toggle desktop icon visibility
try
	set toggle to do shell script "defaults read com.apple.finder CreateDesktop"
	if toggle is "TRUE" then
		do shell script "defaults write com.apple.finder CreateDesktop false"
	else if toggle is "FALSE" then
		do shell script "defaults write com.apple.finder CreateDesktop true"
	end if
end try
do shell script "killall Finder"