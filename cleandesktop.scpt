set lang to do shell script "defaults read .GlobalPreferences AppleLanguages | sed -n 2p"
if lang is "    \"zh-Hans-CN\"," then
	#reverse menu bar visibility
	tell application "System Preferences"
		activate
		set current pane to pane "com.apple.preference.general"
	end tell
	delay 0.3
	#if not delay, the window animation will let click action to fail
	tell application "System Events"
		tell application process "System Preferences"
			tell window "通用"
				click checkbox "自动隐藏和显示菜单栏"
			end tell
		end tell
	end tell
	if application "System Preferences" is running then
		tell application "System Preferences" to quit
	end if
	
	#reverse dock visibility
	tell application "System Events"
		tell dock preferences
			if autohide is true then
				set autohide to false
			else
				set autohide to true
			end if
		end tell
	end tell
	
	#reverse desktop icon visibility
	try
		set toggle to do shell script "defaults read com.apple.finder CreateDesktop"
		if toggle is "TRUE" then
			do shell script "defaults write com.apple.finder CreateDesktop false"
		else if toggle is "FALSE" then
			do shell script "defaults write com.apple.finder CreateDesktop true"
		end if
	end try
	do shell script "killall Finder"
else
	#reverse menu bar visibility
	tell application "System Preferences"
		activate
		set current pane to pane "com.apple.preference.general"
	end tell
	delay 0.3
	#if not delay, the window animation will let click action to fail
	tell application "System Events"
		tell application process "System Preferences"
			tell window "General"
				click checkbox "Automatically hide and show the menu bar"
			end tell
		end tell
	end tell
	if application "System Preferences" is running then
		tell application "System Preferences" to quit
	end if
	
	#reverse dock visibility
	tell application "System Events"
		tell dock preferences
			if autohide is true then
				set autohide to false
			else
				set autohide to true
			end if
		end tell
	end tell
	
	#reverse desktop icon visibility
	try
		set toggle to do shell script "defaults read com.apple.finder CreateDesktop"
		if toggle is "TRUE" then
			do shell script "defaults write com.apple.finder CreateDesktop false"
		else if toggle is "FALSE" then
			do shell script "defaults write com.apple.finder CreateDesktop true"
		end if
	end try
	do shell script "killall Finder"
end if