#!/bin/bash

username=$(whiptail --title "Delete User" --inputbox "Enter username to delete:" 0 0 3>&1 1>&2 2>&3 3>&-)

# if nothing entered
if [ -z "$username" ]; then
    whiptail --title "Delete User" --msgbox "No Users entered." 0 0
# if the user exists
elif id "$username" >/dev/null 2>&1; then
    userdel -r "$username" 2>/dev/null
    whiptail --title "Delete User" --msgbox "User $username deleted successfully." 0 0
# if user does not exist
else
    whiptail --title "Delete User" --msgbox "User $username does not exist." 0 0
fi