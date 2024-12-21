#!/usr/bin/env bash
flag="$2"                              # Catching flag
main_command="$@"           # whole command

# Declare an array of system flags
system_flags=("--about" "-a" "--help" "-h" "-?" "--uninstall" "-un" "--update" "-u" "--version" "-v" "--config" "-cfg" "--release" "-rn" "--readme" "-rdm")

# looping through all system flags
i=0             #indexing variable
while [ $i -lt 17 ]  
do 
# Checking if the flag is system flag
    if [ "$flag" == "${system_flags[i]}" ]  
            then {
                $main_command # Passing command without any change
                break   # exiting the loop if match found
            }
    fi
((i++))
done

# Executing command in backgroud

nohup $main_command  > /dev/null 2>&1 &