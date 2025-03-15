# Update Check Function

function updateCheck (){
    cd ~
    wget -q  https://raw.githubusercontent.com/BlackPearlTech/SearchitTerminal/refs/heads/master/resource/version
    if [ -f ~/version ]
    then {
        AvailableVersion=$(cat version)
        if [ "$AvailableVersion" == "$version" ]
        then {
                echo""
              }
        else {
            echo "${green}Version $AvailableVersion is availavle. Use ${bold}\"searchit -u\"${normal}${green} to update.${normal}"
                rm ~/version
            }
        fi
        }
    fi
    if [ -f ~/version ]
    then {
       rm ~/version
    }
    fi

}
