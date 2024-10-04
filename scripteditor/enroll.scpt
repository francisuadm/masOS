-- Display a confirmation dialog
set confirmation to button returned of (display dialog "Are you sure you want to enroll from Jamf?" buttons {"Cancel", "enroll"} default button "Cancel" with title "enroll Jamf")

-- If the user confirms, proceed with unenrollment
if confirmation is "enroll" then
 
 -- Define the full path to the jamf command
 -- set jamfPath to "/usr/local/jamf/bin/"
 
 -- Run the commands with admin privileges
 do shell script "sudo profiles renew -type enrollment" with administrator privileges
 do shell script "sudo /usr/local/jamf/bin/Jamf Recon" with administrator privileges
 do shell script "sudo /usr/local/jamf/bin/Jamf Policy" with administrator privileges
 do shell script "sudo reboot" with administrator privileges
 
 -- Notify the user that unenrollment is complete
 display dialog "Jamf enrollment completed." buttons {"OK"} default button "OK" with title "Unenroll Jamf"
else
 -- User canceled the operation
 display dialog "Jamf unenrollment canceled." buttons {"OK"} default button "OK" with title "Unenroll Jamf"
end if
