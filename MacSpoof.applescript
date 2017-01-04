set latestVersion to "1.0.3"
(* MacSpoof, MacAddress changer for OS X
an automated mac spoofer that uses built in OS X terminal commands 

Script by Madison Spry.
http://www.mspry.net/

http://licence.visualidiot.com
Basically, you’re free to do what you want with it; as long as you do something good (help someone out, smile; just be nice), you can use this on anything you fancy. Of course, if it all breaks, it’s totally not the author’s fault. Enjoy!
MacSpoof Changelog
--------------------------------------------
1.0.3
- Removed the changelog pop up as it made no sense
- Tested working up to Mac OS Sierra 10.12.2

1.0.2
- Toggle WiFi after change as way to make sure Mac Address changes
- Fixed Error message going off when it shouldn't

1.0
- MacSpoof is now version 1

0.7.2
- Checks against Mac Address look up command after changing to ensure it changed.
- If Mac Address change fails, push error and try again... if fails again push error message.
- Fixed: Title now automatically adjusts to latest version of the script... and not the currentVersion in the preference.

0.7.1 fixed.
- Fixed a small mess up...

0.7.1
Once randomize on boot is finished I'll will call this app a complete version 1.0
- A bit of house keeping and clean up of previous changes
- Nicer titles on Dialog buttons
- Added Version Checker, will show changes after launching update (Launches in TextEdit)

0.7.0
- Now using plists for configuration, might do some cool stuff with this later.
- Accept the disclaimer once, and never see it again. Makes the process faster!
- Save a copy of your original Mac Address in a preference file, Restore it later with ease :)
- Completely re-written, much better now... needs to be cleaned again though.
- Expect another update soon... I may broken something else with this one.
- Kind of just pushing this now incase I break it again (even more) I have a backup.

0.6.1
- Fixed issue where Mac Address may not change because Terminal wasn't selected (Removed tell Terminal)
- Run the terminal command a couple more times, this will ensure the address will change.

0.5
- Bit of Clean up and Organization of script source
- Clarified messages and warnings
- Changed closing message, removed buggy detection of 'original' Mac  Address which could show a previously spoofed mac making it pointless to keep.

0.4.1
- Changed encoding so that you can see the source code from BitBucket :D

0.4
- Slightly improved UI
- Removed lists in favour of dialog boxes
- Added names to en0 (wifi) / en1 (ethernet)
- Added comments for whats happening in the script
- Cleaned up script

0.3
- Added choice for automatic spoofing or choosing your own address to spoof
- Shows old Mac Address and new Mac Address at the end.

0.2.1
- Added to git

0.2
- Added support for en1 (ethernet) and en0 (wifi)

0.1
- First Version
- Very basic, not idiot proof... yet
- Only works with Wi-Fi as of now
*)
on checkFirstRun()
	local isPrefFileExists, prefFilePath
	set prefFilePath to "~/Library/Preferences/net.mspry.MacSpoof.plist"
	try
		tell application "System Events"
			if exists file prefFilePath then
				set isPrefFileExists to true
			else
				set isPrefFileExists to false
			end if
		end tell
	end try
	return not isPrefFileExists
end checkFirstRun

# The script starts Here
if (checkFirstRun()) then
	display dialog "For legal reasons I have to put this here, I've never had an issue but just in case please read and agree, I won't bother you again about it." & return & return & "The work is provided “as is”, without warranty or support, express or implied. The author(s) are not liable for any damages, misuse, or other claim, whether from or as a consequence of usage of the given work." & return & return & "Tested with OS X versions: 10.7 - 10.12" & return & "With that said press OK to agree and continue" with title "MacSpoof - Disclaimer" with icon caution
	try
		-- Save Wireless Mac Address
		do shell script "ifconfig en1 | grep ether"
		set originalen1MacAddress to result
		try
			-- Save originalen1MacAddress in the preferences.
			do shell script "defaults write me.mspry.MacSpoof 'originalen1MacAddress' '" & originalen1MacAddress & "'"
		end try
		-- Save Ethernet Mac Address
		do shell script "ifconfig en0 | grep ether"
		set originalen0MacAddress to result
		try
			-- Save originalen0MacAddress in the preferences.
			do shell script "defaults write me.mspry.MacSpoof 'originalen0MacAddress' '" & originalen0MacAddress & "'"
		end try
	end try
	try
		do shell script "defaults write me.mspry.MacSpoof 'LastConfigVersionUpdate' '0.7'"
	end try
end if
set currentVersion to do shell script "defaults read me.mspry.MacSpoof LastConfigVersionUpdate"
if (currentVersion = latestVersion) then
	# Do Nothing
else
	try
		do shell script "defaults write me.mspry.MacSpoof 'LastConfigVersionUpdate' '" & latestVersion & "'"
	end try
end if

# Network Selection
if button returned of (display dialog "Welcome to MacSpoof v" & latestVersion & return & "Choose which Mac Address you would like to change." buttons {"Wi-Fi", "Ethernet"} with title "MacSpoof - Welcome") is "Wi-Fi" then
	set network to "en1"
	set networkChoice to "Wi-Fi"
else
	set network to "en0"
	set networkChoice to "Ethernet"
end if

# Select Randomize, Choose, or Restore
set userAnswer_Functions to the button returned of (display dialog "Choose how you would like to change your Mac Address." buttons {"Randomize", "Choose", "Restore"} with title "MacSpoof - " & networkChoice)
if (userAnswer_Functions = "Randomize") then
	try
		do shell script "openssl rand -hex 1"
		set randomizer_p1 to result
		do shell script "openssl rand -hex 1"
		set randomizer_p2 to result
		do shell script "openssl rand -hex 1"
		set randomizer_p3 to result
		do shell script "openssl rand -hex 1"
		set randomizer_p4 to result
		do shell script "openssl rand -hex 1"
		set randomizer_p5 to result
		do shell script "openssl rand -hex 1"
		set randomizer_p6 to result
		do shell script "echo ether " & randomizer_p1 & ":" & randomizer_p2 & ":" & randomizer_p3 & ":" & randomizer_p4 & ":" & randomizer_p5 & ":" & randomizer_p6
		set ChangeMacAddress_result to result
	end try
else if (userAnswer_Functions = "Choose") then
	try
		display dialog "Enter the Mac Address you would like to spoof to." default answer "A1:B2:C3:D4:E5:F6" with icon 2 buttons {"OK"} with title "MacSpoof - " & networkChoice & " - " & userAnswer_Functions with answer
		set MacAddress_Choice to text returned of result
		do shell script "echo ether " & MacAddress_Choice
		set ChangeMacAddress_result to result
	end try
else if (userAnswer_Functions = "Restore") then
	try
		-- Get / Set the original MacAddresses
		set ChangeMacAddress_result to do shell script "defaults read me.mspry.MacSpoof original" & network & "MacAddress"
	on error number 1
		display alert "Error: Your Mac Address does not seem have been saved"
	end try
end if

display dialog "Your Mac Address will be changed to: " & return & return & ChangeMacAddress_result & return & return & "Press OK to continue or cancel to quit and not make changes." & return & "You will be prompted for your password to make changes if you choose to proceed." with title "MacSpoof - " & networkChoice & " - Confirmation"

(* This is where the Mac Address changes *)
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
(* Toggle WiFi *)
do shell script "networksetup -setairportpower en1 off" with administrator privileges
set ChangeMacAddress_confirm to do shell script "ifconfig " & network & "| grep ether"

try
	do shell script "networksetup -setairportpower en1 on" with administrator privileges
	if (ChangeMacAddress_confirm contains ChangeMacAddress_result) then
		display dialog "Done! Your " & networkChoice & " Mac Address is now: " & return & return & ChangeMacAddress_confirm & return & return & "Please keep in mind that all changes made by this application are NOT permanent, rebooting your Mac will always restore the original Mac Address." with title "MacSpoof" buttons ("OK, Exit now")
	else
		display dialog "Error: Your " & networkChoice & " MacAddress has not been changed, try toggling your " & networkChoice & " on and off to ensure your Mac Address has changed" & return & return & "Otherwise click OK to try one more time"
		try
			do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
			do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
			do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
			if (ChangeMacAddress_confirm contains ChangeMacAddress_result) then
				display dialog "Done! Your " & networkChoice & " Mac Address is now: " & return & return & ChangeMacAddress_confirm & return & return & "Please keep in mind that all changes made by this application are NOT permanent, rebooting your Mac will always restore the original Mac Address." with title "MacSpoof" buttons ("OK, Exit now")
			end if
		end try
		display dialog "Error: Your " & networkChoice & " Mac Address has not been changed, try toggling the " & networkChoice & return & return & "If the issue persists, please contact me"
	end if
end try