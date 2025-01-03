#   Config File Generator

function config() {
    cat ~/.config/SearchitTerminal/searchit.cfg | grep "Default"
    echo ""
    echo "${blue}Do You Want To Change This Configuration? (Y/N):${normal}"
    read decision;
    if [ "$decision" == "Y" ] || [ "$decision" == "y" ]
    then {
        cd ~/.config/SearchitTerminal/
        rm searchit.cfg
        browserCheck
        defaultEngine
        cat  >> searchit.cfg <<CONFIGEND
Searchit Configuration File.
Please Do Not Make Any Change To This File.
Use Command "searchit -cfg" To Make Any Changes
----------------------------------

Default Browser: $var1
Default Search Engine: $var2
CONFIGEND
    echo "Default Configuration Has Been Changed!"
        }
        else {
            echo "No Change Has Been Made For Default Configuration"
        }
        fi
    }
