#!/bin/bash

username=$(whiptail --title "Change Password" --inputbox "Enter the username to change password for:" 0 0 3>&1 1>&2 2>&3 3>&-)
if id -u "$username" >/dev/null 2>&1; then
    new_password=$(whiptail --title "Change Password" --passwordbox "Enter the new password:" 0 0 3>&1 1>&2 2>&3 3>&-)
    echo "$username:$new_password" | chpasswd >/dev/null 2>&1
    whiptail --title "Success" --msgbox "Password for user '$username' has been changed." 0 0
else
    whiptail --title "Error" --msgbox "User '$username' does not exist." 0 0
fi