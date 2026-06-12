#!/bin/bash

groupname_mod=$(whiptail --title "Modify Group" --inputbox "Enter the group name to modify:" 0 0 3>&1 1>&2 2>&3)
if getent group "$groupname_mod" > /dev/null 2>&1; then
    new_groupname=$(whiptail --title "Modify Group" --inputbox "Enter the new group name:" 0 0 3>&1 1>&2 2>&3)
    if getent group "$new_groupname" > /dev/null 2>&1; then
        whiptail --title "Error" --msgbox "Group '$new_groupname' already exists." 0 0
    else
        if groupmod -n "$new_groupname" "$groupname_mod"; then
            whiptail --title "Success" --msgbox "Group '$groupname_mod' has been renamed to '$new_groupname' successfully." 0 0
        else
            whiptail --title "Error" --msgbox "Failed to rename group '$groupname_mod'." 0 0
        fi
    fi
else
    whiptail --title "Error" --msgbox "Group '$groupname_mod' does not exist." 0 0
fi