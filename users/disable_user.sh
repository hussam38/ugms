#!/bin/bash

username=$(whiptail --title "Disable User" --inputbox "Enter the username to disable:" 0 0 3>&1 1>&2 2>&3 3>&-)
if id -u "$username" >/dev/null 2>&1; then
    usermod -L "$username"
    whiptail --title "Success" --msgbox "User '$username' has been disabled." 0 0
else
    whiptail --title "Error" --msgbox "User '$username' does not exist." 0 0
fi
