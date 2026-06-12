#!/bin/bash

username=$(whiptail --title "Modify User" --inputbox "Enter the username of the user you want to modify:" 0 0 3>&1 1>&2 2>&3 3>&-)

if ! id "$username" &>/dev/null || [[ -z "$username" ]]; then
    whiptail --title "Error" --msgbox "User $username does not exist." 0 0
    exit 1
fi

menu=$(whiptail --title "Modify User" --menu "Choose an option to modify for user $username" 0 0 0 \
    "1" "Change Username" \
    "2" "Change Home Directory" \
    "3" "Change Shell" \
    "4" "Change Group Membership" 3>&1 1>&2 2>&3 3>&-)

[[ -z "$menu" ]] && exit 0

case $menu in
    "1")
        new_username=$(whiptail --title "Change Username" --inputbox "Enter the new username for $username:" 0 0 3>&1 1>&2 2>&3 3>&-)
        if [[ -n "$new_username" ]]; then
            current_home=$(eval echo "~$username")
            if [[ "$current_home" == "/home/$username" ]]; then
                usermod -l "$new_username" -d "/home/$new_username" -m "$username"
            else
                usermod -l "$new_username" "$username"
            fi
            whiptail --title "Success" --msgbox "Username changed to $new_username." 0 0
        fi
        ;;
    "2")
        new_home=$(whiptail --title "Change Home Directory" --inputbox "Enter the new home directory for $username:" 0 0 3>&1 1>&2 2>&3 3>&-)
        if [[ -n "$new_home" ]]; then
            usermod -d "$new_home" -m "$username"
            whiptail --title "Success" --msgbox "Home directory updated." 0 0
        fi
        ;;
    "3")
        new_shell=$(whiptail --title "Change Shell" --inputbox "Enter the new shell for $username (e.g., /bin/bash):" 0 0 3>&1 1>&2 2>&3 3>&-)
        if [[ -n "$new_shell" ]]; then
            usermod -s "$new_shell" "$username"
            whiptail --title "Success" --msgbox "Shell updated to $new_shell." 0 0
        fi
        ;;
    "4")
        new_groups=$(whiptail --title "Change Group Membership" --inputbox "Enter the new groups for $username (comma-separated):" 0 0 3>&1 1>&2 2>&3 3>&-)
        if [[ -n "$new_groups" ]]; then
            clean_groups=$(echo "$new_groups" | tr -d ' ')
            usermod -G "$clean_groups" "$username"
            whiptail --title "Success" --msgbox "Groups updated." 0 0
        fi
        ;;
esac