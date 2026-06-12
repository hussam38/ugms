#!/bin/bash

awk -F: '{print $1}' /etc/passwd > /tmp/users.txt
whiptail --title "List Users" \
    --textbox /tmp/users.txt 0 0
rm -f /tmp/users.txt



