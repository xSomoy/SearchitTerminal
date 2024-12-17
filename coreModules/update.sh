#   Update Function

function update(){
    cd ~
    wget -q https://raw.githubusercontent.com/xSomoy/SearchitTerminal/refs/heads/master/resource/version |
    echo "Checking For Update..."
    if [ -f ~/version ]
    then {
        AvailableVersion=$(cat version)
        if [ "$AvailableVersion" == "$version" ]
        then {
              echo "${blue}Your Version: $version"
              echo "${aqua}Latest Version: $AvailableVersion"
              echo "${green}You Are Updated${normal}"
              }
        else {
              echo "${blue}Your Version: $version"
              echo "${aqua}Latest Version: $AvailableVersion"
               echo "${green}${bold}Version $AvailableVersion Is Available. Do You Want To Update?(Y/y = yes)${normal}"
               read decision;
               if [ "$decision" == "Y" ] || [ "$decision" == "y" ]
               then {
                 wget -q https://github.com/xSomoy/SearchitTerminal/archive/refs/heads/master.zip |
                 echo "${aqua}${blink}Downloading Latest Version...${normal}"
                 if [ -f ~/master.zip ]
                 then {
                      sudo rm -r  /usr/share/SearchitTerminal
                      unzip master.zip
                      clear
                      cd SearchitTerminal-master
                      chmod +x installer.sh
                      ./installer.sh
                      rm ~/master.zip
                      rm -r ~/SearchitTerminal-master
                      echo "${green}Update Complete !! ${normal}"
                    }
                 else {
                    echo "${red}ERROR: Unable to download updates. Check your internet connection. Or Try again later${normal}"
                  }
                 fi
               }
               else {
                  echo "${gray}Maybe Later. -_-${normal}"
                }
               fi
              }
        fi
        rm ~/version
        }
    else
      {
        echo "ERROR: Unable to check update. Check your internet connection. Or Try again later
              "
      }
    fi
    if [ -f ~/.wget-hsts ]
    then {
       rm ~/.wget-hsts
    }
    fi
  }
