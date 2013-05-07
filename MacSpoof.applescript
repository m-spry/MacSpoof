(* Mac Address Spoofer v0.4, 
an automated mac spoofer that uses built in OS X terminal commands 

Changelog
-----------
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
- Shows old mac address and new mac address at the end.

0.2.1
- Added to git

0.2
- Added support for en1 (ethernet) and en0 (wifi)

0.1
- First Version
- Very basic, not idiot proof... yet
- Only works with Wi-Fi as of now

http://licence.visualidiot.com

Basically, youÕre free to do what you want with it; as long as you do something good (help someone out, smile; just be nice), you can use this on anything you fancy. Of course, if it all breaks, itÕs totally not the authorÕs fault. Enjoy!

*)

display dialog "The work is provided Òas isÓ, without warranty or support, express or implied. The author(s) are not liable for any damages, misuse, or other claim, whether from or as a consequence of usage of the given work." & return & return & "With that said press OK to continue" with title "Disclaimer"

if button returned of (display dialog "Choose what you would like to spoof" buttons {"Wi-Fi", "Ethernet"} with title "MacSpoof") is "Wi-Fi" then
	set network to "en1"
	set networkChoice to "Wi-Fi"
else
	set network to "en0"
	set networkChoice to "Ethernet"
end if

if button returned of (display dialog "Choose how to spoof your Mac Address" buttons {"Randomize", "Choose"} with title "MacSpoof") is "Randomize" then
	(* Get the old Mac Address for confirmation msg *)
	tell application "Terminal" to do shell script "ifconfig " & network & " |grep ether"
	set oldmacad to result
	
	(* The Worlds LAZIEST working Mac Address randomizer
	Basically, generates 6 hex parts then glues them together
	and takes the glued mac -> used in confirmation msg *)
	do shell script "openssl rand -hex 1"
	set macad1 to result
	do shell script "openssl rand -hex 1"
	set macad2 to result
	do shell script "openssl rand -hex 1"
	set macad3 to result
	do shell script "openssl rand -hex 1"
	set macad4 to result
	do shell script "openssl rand -hex 1"
	set macad5 to result
	do shell script "openssl rand -hex 1"
	set macad6 to result
	do shell script "echo " & macad1 & ":" & macad2 & ":" & macad3 & ":" & macad4 & ":" & macad5 & ":" & macad6
	set randommacad to result
	
	(* Where the magic happens *)
	tell application "Terminal" to do shell script "sudo ifconfig " & network & " ether " & randommacad & "" with administrator privileges
	
	(* Tell the user what the mac has changed to and warn it will return to the previous mac on reboot *)
	display dialog "Done! Your new " & networkChoice & " Mac Address is " & randommacad & return & return & "Upon reboot your mac will return to " & oldmacad with title "MacSpoof" buttons ("OK, Exit now")
	
else
	(* Get the old Mac Address for confirmation msg *)
	tell application "Terminal" to do shell script "ifconfig " & network & " |grep ether"
	set oldmacad to result
	
	(* User imputs desired Mac Address -> takes that and puts it into ifconfig cmd and confirmation msg *)
	display dialog "Enter the mac address you would like to spoof to." & return & return & "Ex. 00:11:22:33:44:55" default answer "00:11:22:33:44:55" with icon 2 with title "MacSpoof" with answer
	set macad to text returned of result
	
	(* Where the magic happens *)
	tell application "Terminal" to do shell script "sudo ifconfig " & network & " ether " & macad & "" with administrator privileges
	
	(* Tell the user what the mac has changed to and warn it will return to the previous mac on reboot *)
	display dialog "Done! Your new " & networkChoice & " Mac Address is " & macad & return & return & "Upon reboot your " & networkChoice & " Mac Address will return to " & oldmacad with title "MacSpoof" buttons {"OK, Exit now"}
end if