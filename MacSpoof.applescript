(* Mac Address Spoofer v0.7, 
an automated mac spoofer that uses built in OS X terminal commands 

Changelog
-----------
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
- Changed closing message, removed buggy detection of "original" Mac  Address which could show a previously spoofed mac making it pointless to keep.

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

http://licence.visualidiot.com

Basically, you’re free to do what you want with it; as long as you do something good (help someone out, smile; just be nice), you can use this on anything you fancy. Of course, if it all breaks, it’s totally not the author’s fault. Enjoy!

*)
#
# Check First Run
#
if (checkFirstRun()) then
	display dialog "For legal reasons I have to put this here, I've never had an issue but just in case:" & return & return & "The work is provided “as is”, without warranty or support, express or implied. The author(s) are not liable for any damages, misuse, or other claim, whether from or as a consequence of usage of the given work." & return & return & "Tested with OS X versions: 10.7 - 10.9 DP" & return & "With that said press OK to agree and continue" with title "MacSpoof - Disclaimer" with icon caution
	
	set userAnswer to the button returned of (display dialog "Thank You for trying MacSpoof!" & return & return & "Do you want to backup your original Mac Addresses?" & return & return & "You won't be asked this again. It is recommended that you press yes." with title "MacSpoof - First things first" with icon 1 buttons {"No", "Yes"} default button 2)
	if (userAnswer = "Yes") then
		try
			my saveOriginalMacAddresses()
		end try
	end if
	try
		do shell script "defaults write me.mspry.MacSpoof 'LastConfigVersionUpdate' '0.7'"
	end try
end if
#
# Network Selection
#
if button returned of (display dialog "Choose which Mac Address you would like to change" buttons {"Wi-Fi", "Ethernet"} with title "MacSpoof") is "Wi-Fi" then
	set network to "en1"
	set networkChoice to "Wi-Fi"
else
	set network to "en0"
	set networkChoice to "Ethernet"
end if
#
# Select Randomize, Choose, or Restore
#
set userAnswer_Functions to the button returned of (display dialog "Choose how you would like to change your Mac Address" buttons {"Randomize", "Choose", "Restore"} with title "MacSpoof")
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
		display dialog "Enter the Mac Address you would like to spoof to." & return & return & "Ex. 00:11:22:33:44:55" default answer "00:11:22:33:44:55" with icon 2 with title "MacSpoof - Choose" with answer
		set MacAddress_Choice to text returned of result
		do shell script "echo ether " & MacAddress_Choice
		set ChangeMacAddress_result to result
	end try
else if (userAnswer_Functions = "Restore") then
	try
		-- Get / Set the original MacAddresses
		set ChangeMacAddress_result to do shell script "defaults read me.mspry.MacSpoof original" & network & "MacAddress"
	on error number 1
		display alert "You didn't save your Mac Addresses when I asked you earlier" & return & return & "Cannot continue, sorry."
	end try
end if

display dialog "Your Mac Address will be changed to " & ChangeMacAddress_result & return & return & "Press OK to continue or cancel to quit." & return & "You will be prompted for your password to make changes." with title "MacSpoof - Confirmation"

(* This is where the Mac Address changes *)
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges
do shell script "sudo ifconfig " & network & " " & ChangeMacAddress_result with administrator privileges

display dialog "Done! Your " & networkChoice & " Mac Address is now " & ChangeMacAddress_result & return & return & "Please keep in mind that this is not an permanent change and will revert to your original Mac Address on reboot." with title "MacSpoof" buttons ("OK, Exit now")

#
# First run and Mac Address Saving and stuff...
# Might move these, just here for now until I figure something else out.
#

on checkFirstRun()
	local isPrefFileExists, prefFilePath
	set prefFilePath to "~/Library/Preferences/me.mspry.MacSpoof.plist"
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

on saveOriginalMacAddresses()
	-- Save Wireless
	do shell script "ifconfig en1 | grep ether"
	set originalen1MacAddress to result
	try
		-- Save originalWirelessMacAddress in the preferences.
		do shell script "defaults write me.mspry.MacSpoof 'originalen1MacAddress' '" & originalen1MacAddress & "'"
	end try
	-- Save Ethernet
	do shell script "ifconfig en0 | grep ether"
	set originalen0MacAddress to result
	try
		-- Save originalEthernetMacAddress in the preferences.
		do shell script "defaults write me.mspry.MacSpoof 'originalen0MacAddress' '" & originalen0MacAddress & "'"
	end try
end saveOriginalMacAddresses
