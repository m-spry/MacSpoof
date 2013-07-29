(* Mac Address Spoofer v0.7, 
an automated mac spoofer that uses built in OS X terminal commands 

Changelog
-----------
0.7
- Saves a copy of your original Mac Address in a preference file, for backup purposes.
- If selected it can now randomize your Mac Address on boot up.

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
display dialog "The work is provided “as is”, without warranty or support, express or implied. The author(s) are not liable for any damages, misuse, or other claim, whether from or as a consequence of usage of the given work." & return & return & "Tested with OS X versions: 10.7 - 10.9 DP" & return & "With that said press OK to agree and continue" with title "Disclaimer: For legal reasons I have to put this here" with icon caution

if button returned of (display dialog "Choose which Mac Address you would like to change" buttons {"Wi-Fi", "Ethernet"} with title "MacSpoof") is "Wi-Fi" then
	set network to "en1"
	set networkChoice to "Wi-Fi"
else
	set network to "en0"
	set networkChoice to "Ethernet"
end if

if button returned of (display dialog "Choose how you would like to change your Mac Address" buttons {"Randomize", "Choose"} with title "MacSpoof") is "Randomize" then
	
	(* Mac Address Randomizer *)
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
	do shell script "echo " & randomizer_p1 & ":" & randomizer_p2 & ":" & randomizer_p3 & ":" & randomizer_p4 & ":" & randomizer_p5 & ":" & randomizer_p6
	set randomizer_result to result
	
	(* Warning of Change *)
	display dialog "Your Mac Address will be changed to " & randomizer_result & return & return & "Press OK to continue or cancel to quit." & return & "You will be prompted for your password to make changes." with title "Confirmation"
	
	(* Where the magic happens *)
	do shell script "sudo ifconfig " & network & " ether " & randomizer_result & "" with administrator privileges
	(* Run twice more to ensure it changes *)
	do shell script "sudo ifconfig " & network & " ether " & randomizer_result & "" with administrator privileges
	do shell script "sudo ifconfig " & network & " ether " & randomizer_result & "" with administrator privileges
	
	(* Confirmation of Change *)
	display dialog "Done! Your new " & networkChoice & " Mac Address is " & randomizer_result & return & return & "Please keep in mind that this is not an permanent change and will revert to your original Mac Address on reboot." with title "MacSpoof" buttons ("OK, Exit now")
	
else
	(* Mac Address Input Box *)
	display dialog "Enter the Mac Address you would like to spoof to." & return & return & "Ex. 00:11:22:33:44:55" default answer "00:11:22:33:44:55" with icon 2 with title "MacSpoof" with answer
	set MacAddress_Choice to text returned of result
	
	(* Warning of Change *)
	display dialog "Your Mac Address will be changed to " & MacAddress_Choice & return & return & "Press OK to continue or cancel to quit." & return & "You will be prompted for your password to make changes." with title "Confirmation"
	
	(* Where the magic happens *)
	do shell script "sudo ifconfig " & network & " ether " & MacAddress_Choice with administrator privileges
	(* Run twice more to ensure it changes *)
	do shell script "sudo ifconfig " & network & " ether " & MacAddress_Choice with administrator privileges
	do shell script "sudo ifconfig " & network & " ether " & MacAddress_Choice with administrator privileges
	
	(* Confirmation of Change *)
	display dialog "Done! Your new " & networkChoice & " Mac Address is " & MacAddress_Choice & return & return & "Please keep in mind that this is not an permanent change and will revert to your original Mac Address on reboot." with title "MacSpoof" buttons {"OK, Exit now"}
end if