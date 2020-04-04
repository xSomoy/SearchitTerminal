#!/usr/bin/env bash

#   Uninstalling If Older Version of Searchit Terminal is already installed

echo "Checking If Older Version Of Searchit Exist..."
sleep 1s
if [ -f /usr/bin/searchit ] || [ -f /usr/bin/googleit ] || [ -f /usr/bin/duckit ] || [ -f /usr/share/applications/st.desktop ] || [ -d ~/.searchit ]
    then {
            echo "Older Version Of Searchit Terminal Is Found"
            sleep 1s
            echo "Removing Old Version Files..."
            sleep 1s
            sudo rm /usr/bin/searchit /usr/bin/googleit /usr/bin/duckit
            sudo rm /usr/share/applications/st.desktop
            sudo rm -r ~/.searchit
            echo "Old Version Of Searchit Terminal Removed"
            sleep 1s
            echo "Installing Newer Version Of Searchit Terminal"
            sleep 1s
        }
    else {
            echo "No Older Version of Searchit Terminal Found"
            sleep 1s
            clear
            echo "Installing Newer Version Of Searchit Terminal"
        }
    fi