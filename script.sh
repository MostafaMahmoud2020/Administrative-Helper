#!/bin/bash

# Administrative Helper , take an option from user and perform a task.

while true; do

    
    echo "Welcome $USER to Administrative Helper"
    echo "-------------------------------------"
    echo "Please select an option from the menu below:"
    echo "-------------------------------------"
    echo "1-->  Add a new user"
    echo "2-->  Delete user account"
    echo "3-->  Modify an existing user"
    echo "4-->  Disable user account"
    echo "5-->  Enable user account"
    echo "6-->  Change user password"
    echo "7-->  List users"
    echo "8-->  Delete user account with home directory"
    echo "9-->  Delete user account without home directory"
    echo "10--> Add a new group"
    echo "11--> Modify an existing group"
    echo "12--> List groups"
    echo "13--> Delete a group"
    echo "14--> Add user to group"
    echo "15--> Exit"
    echo "-------------------------------------"
    read -p "Enter your choice (1-15): " choice

    case $choice in 

    1)
        read -p "Enter username for new user: " username
        useradd -m "$username"
        echo "User $username added successfully."
        echo " "
        ;;

    2) 
        read -p "Enter username to delete: " username
        userdel "$username"
        echo "User $username deleted successfully."
        echo " "
        ;;

    3)
        read -p "Enter username to modify: " username
        read -p "Enter new username: " new_username
        usermod -d "/home/$new_username" -m -l "$new_username" "$username"
        echo "User $username modified to $new_username successfully."
        echo " "
        ;;


    4)
        read -p "Enter username to disable: " username
        usermod -L "$username"
        echo "User $username disabled successfully."
        echo " "
        ;;

    5)             
        read -p "Enter username to enable: " username
        usermod -U "$username"
        echo "User $username enabled successfully."
        echo " "
        ;;

     6)
        read -p "Enter username to change password: " username
        read -s -p "Enter new password: " password
        echo "$password" | passwd --stdin "$username"
        echo "Password for user $username changed successfully."
        echo " "
        ;;

    7)
        echo "List of users:"
        cut -d: -f1 /etc/passwd
        echo " "
        ;;


    8)
        read -p "Enter username to delete with home directory: " username
        userdel -r "$username"
        echo "User $username and home directory deleted successfully."
        echo " "
        ;;


    9)
        read -p "Enter username to delete without home directory: " username
        userdel "$username"
        echo "User $username deleted successfully."
        echo " "
        ;;


    10)
        read -p "Enter group name to add: " groupname
        groupadd "$groupname"
        echo "Group $groupname added successfully."
        echo " "
        ;;


    11)
        read -p "Enter group name to modify: " groupname
        read -p "Enter new group name: " new_groupname
        groupmod -n "$new_groupname" "$groupname"
        echo "Group $groupname modified to $new_groupname successfully."
        echo " "
        ;;

     12)
         echo "List of groups:"
          cut -d: -f1 /etc/group
        echo " "
          ;;

    13)
        read -p "Enter group name to delete: " groupname
        groupdel "$groupname"
        echo "Group $groupname deleted successfully."
        echo " "
        ;;  

    14)
        read -p "Enter username to add to group: " username
        read -p "Enter group name to add user to: " groupname
        usermod -aG "$groupname" "$username"
        echo "User $username added to group $groupname successfully."
        echo " "
        ;;  

    15)
        echo "Exiting the Administrative Helper."
        exit 0
        ;;


    *)
        echo "Invalid option. Please try again."
        echo " "
        ;;
    esac
done

# End of the script

# Note: This script requires root privileges to execute user and group management commands.
# You can run it with sudo: sudo ./filename