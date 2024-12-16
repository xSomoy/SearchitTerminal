#   Double Check Uninstall

    function uninstallCheck() {
        cd ~
        if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f /usr/share/applications/SearchitTerminal.desktop ] && [ -d /usr/share/SearchitTerminal ] && [ -d ~/.searchit ]
        then {
            echo "${red}${bold}Uninstallation Failed"
            echo "Report Problem : https://github.com/xSomoy/SearchitTerminal/issues ${normal}"
        }
        else {
            echo "${orange}
    Uninstallation Complete!! :(
    Sorry To See You Go. You Can Help Me To Improve Searchit.
    You Can Report Any Issue On Github.
    Or Directly Contact Me Via Twitters
    ${blue}
       Github:   https://github.com/xSomoy
       Facebook: https://facebook.com/SearchitOfficial
       Email:    mailtoSearchit@gmail.com
       Twitter:  https://twitter.com/Tweet2Searchit

       ${bold}${WHITE}${black}Copyright © 2024 Mushphyqur Rahman${normal}

            "
            }
        fi
    }
