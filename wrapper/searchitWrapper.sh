#!/usr/bin/env bash
flags="$2"                              # Catching first flag
main_command="$@"           # whole command

echo "$flags"
echo "$main_command"

if [ "$flags" == '-'a ] || [ "$flags" == '--about' ] || [ "$flags" == '-h' ] || [ "$flags" == '--help' ] || [ "$flags" == '-?' ] || [ "$flags" == '-un' ] || [ "$flags" == '-'-uninstall ] || [ "$flags" == '-' ] ||
                then {
                    connectionTest
                    drugs
                }
            else {
                connectionTest
                defaultSearch
            }
            fi

#nohup $parameter  > /dev/null 2>&1 &