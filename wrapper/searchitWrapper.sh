#!/usr/bin/env bash
flag="$2"                              # Catching first flag
main_command="$@"           # whole command

echo "$flag"
echo "$main_command"

# Declare an array of system flags
system_flags=("--about" "-a" "--help" "-h" "-?" "--uninstall" "-un" "--update" "-u" "--version" "-v" "--config" "-cfg" "--release" "-rn" "--readme" "-rdm")
i=0
echo ${system_flags[i]}
while [ $i -lt 17 ]  
do 
    if [ "$flag" == "${system_flags[i]}" ]
            then {
                echo "$flag"
                $main_command
                break
            }
    fi
((i++))
done

# nohup parameter  > /dev/null 2>&1 &