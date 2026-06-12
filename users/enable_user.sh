#!/bin/bash

username=$(whiptail --title "Enable User" --inputbox "Enter the username to enable:" 0 0 3>&1 1>&2 2>&3 3>&-)
if id -u "$username" >/dev/null 2>&1; then
    usermod -U "$username"
    whiptail --title "Success" --msgbox "User '$username' has been enabled." 0 0
else
    whiptail --title "Error" --msgbox "User '$username' does not exist." 0 0
fi
