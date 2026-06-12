#!/bin/bash
cut -d: -f1 /etc/group > /tmp/groups.txt
whiptail --title "List of Groups" --textbox /tmp/groups.txt 0 0
rm /tmp/groups.txt