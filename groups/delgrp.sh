#!/bin/bash

groupname=$(whiptail --title "Delete Group" --inputbox "Enter the name of the group to delete:" 0 0 3>&1 1>&2 2>&3 3>&-)

if getent group "$groupname" > /dev/null 2>&1; then
    if groupdel "$groupname"; then
        whiptail --title "Success" --msgbox "Group '$groupname' has been deleted successfully." 0 0
    else
        whiptail --title "Error" --msgbox "Failed to delete group '$groupname'." 0 0
    fi
else
    whiptail --title "Error" --msgbox "Group '$groupname' does not exist." 0 0
fi