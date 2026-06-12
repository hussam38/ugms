#!/bin/bash

groupname=$(whiptail --title "Add Group" --inputbox "Enter the name of the group to add:" 0 0 3>&1 1>&2 2>&3 3>&-)

if getent group "$groupname" > /dev/null 2>&1; then
    whiptail --title "Error" --msgbox "Group '$groupname' already exists." 0 0
else
    if groupadd "$groupname"; then
        whiptail --title "Success" --msgbox "Group '$groupname' has been added successfully." 0 0
    else
        whiptail --title "Error" --msgbox "Failed to add group '$groupname'." 0 0
    fi
fi