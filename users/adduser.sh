#!/bin/bash

username=$(whiptail --title "Add User" --inputbox "Enter username:" 0 0 3>&1 1>&2 2>&3 3>&-)

if id $username 2>/dev/null; then
    whiptail --title "Add User" --msgbox "User $username already exists." 0 0
elif [ -n "$username" ]; then
    useradd -m $username
    echo "$username:1234" | chpasswd
    chage -d 0 "$username"
    whiptail --title "Add User" --msgbox "User $username added successfully with password '1234'" 0 0
else
    whiptail --title "Add User" --msgbox "No Users entered." 0 0
fi