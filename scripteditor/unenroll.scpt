-- Prompt for admin username and password
-- set adminUsername to text returned of (display dialog "Enter Admin Username:" default answer "")
-- set adminPassword to text returned of (display dialog "Enter Admin Password:" default answer "" with hidden answer)

-- Display a confirmation dialog
set confirmation to button returned of (display dialog "Are you sure you want to unenroll from Jamf?" buttons {"Cancel", "Unenroll"} default button "Cancel" with title "Unenroll Jamf")

-- If the user confirms, proceed with unenrollment
if confirmation is "Unenroll" then
 
 -- Define the full path to the jamf command
 -- set jamfPath to "/usr/local/jamf/bin/"

 
 -- Run the commands with admin privileges
 -- do shell script "sudo profiles renew -type enrollment" with administrator privileges
 do shell script "sudo /usr/local/jamf/bin/Jamf RemoveMDMProfile" with administrator privileges
 do shell script "sudo /usr/local/jamf/bin/Jamf removeFramework" with administrator privileges

 -- Notify the user that unenrollment is complete
 display dialog "Jamf unenrollment completed." buttons {"OK"} default button "OK" with title "Unenroll Jamf"
-- Force reboot now.
 do shell script "sudo reboot" with administrator privileges
 

else
 -- User canceled the operation
 display dialog "Jamf unenrollment canceled." buttons {"OK"} default button "OK" with title "Unenroll Jamf"
end if
