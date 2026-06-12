#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

choice=$(whiptail --title "User Management TUI" --menu "Choose an option" 0 0 0 \
    "Add User" "Add a user to the system." \
    "Modify User" "Modify an existing user." \
    "Delete User" "Delete a user from the system." \
    "List Users" "List all users on the system." \
    "Add Group" "Add a user group to the system." \
    "Modify Group" "Modify a group and its list of members." \
    "Delete Group" "Delete a user group from the system." \
    "List Groups" "List all groups on the system." \
    "Disable User" "Disable a user account." \
    "Enable User" "Enable a user account." \
    "Change Password" "Change a user's password." \
    "About" "Display information about the program." 3>&1 1>&2 2>&3 3>&-)

case $choice in
    "Add User")
        ./users/adduser.sh
        ;;
    "Modify User")
        ./users/moduser.sh
        ;;
    "Delete User")
        ./users/deluser.sh
        ;;
    "List Users")
        ./users/lsusers.sh
        ;;
    "Add Group")
        ./groups/addgrp.sh
        ;;
    "Modify Group")
        ./groups/modgrp.sh
        ;;
    "Delete Group")
        ./groups/delgrp.sh
        ;;
    "List Groups")
        ./groups/lsgrp.sh
        ;;
    "Disable User")
        ./users/disable_user.sh
        ;;
    "Enable User")
        ./users/enable_user.sh
        ;;
    "Change Password")
        ./users/chgpass.sh
        ;;
    "About")
        whiptail --title "About" --msgbox "Users and Groups Management TUI" 0 0
        ;;
esac