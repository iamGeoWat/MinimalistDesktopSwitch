#display dialog "隐藏/显示桌面文件" buttons {"可见", "隐藏"} with icon 2 with title "Switch to presentation mode" default button 1
#set switch to button returned of result
#if switch is "隐藏" then
#	do shell script "defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder"
#else
#	do shell script "defaults delete com.apple.finder CreateDesktop;killall Finder"
#end if

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.general"
end tell

tell application "System Events"
	tell application process "System Preferences"
		tell window "General"
		click checkbox "Automatically hide and show the menu bar"
		end tell
	end tell
end tell
	
#tell application "System Events"
#	tell dock preferences
#		if autohide is true then
#			set autohide to false
#		else
#			set autohide to true
#		end if
#	end tell
#end tell

#tell application "System Events"
#	tell current desktop
#		if translucent menu bar is true then
#			set translucent menu bar to false
#		else
#			set translucent menu bar to true
#		end if
#	end tell
#end tell