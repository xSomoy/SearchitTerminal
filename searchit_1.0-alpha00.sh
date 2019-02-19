#!/usr/bin/env bash
#
#       Searchit
#       A Terminal Based Internet Seach Customizer
#       For Linux Based Operating System
#       Author: Mushphyque Tanveer
#
###################################################
version=1.0-alpha00

#   Creating Command File For Seatchit

function createSearchit() {
    echo "Creating Searchit Command File "
    cat  >> searchit <<SEARCHITEND
    #!/usr/bin/env bash

    #   Modifing Parameter And Query
    parameter="\$1"
    tmpquery="\$@"
    echo \$tmpquery > tmp1
    sed -i 's/\ /+/g' tmp1

    # DuckDuckGo Search Fucntion

    function duckduckgo() {
        sed -i 's/-ddg+//' tmp1
        sed -i 's/-duckduckgo+//' tmp1
        query="\$(cat tmp1)"
        $var1 www.duckduckgo.com/?q=\$query
        rm tmp1
    }

    # Google Search Fucntion

    function google() {
        sed -i 's/-ggl+//' tmp1
        sed -i 's/-google+//' tmp1
        query="\$(cat tmp1)"
        $var1 www.google.com/search?q=\$query
        rm tmp1

    }

    #   Help Function

    function help() {
        echo "
                    \"Searchit Help Section\"

            Parameters / Options For Seachit Command:
                --about     -a          For About Section
                --help      -h    -?    For Help section
                --uninstall -un         For Uninstall
                --update    -u          For Update

            Search Commands:
                duckit                  For DuckDuckGo
                googleit                For Google

                    Ex: \" duckit casino royal \"
                "
    }

    #   Uninstaller function

    function uninstaller(){
        echo " Do You Really Want To Uninstall Seachit? (Y/N):"
        read decision;
        if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
        then {
            echo "Chainging Directory"
            cd /usr/bin
            echo "Removing Searchit Related Files"
            sudo rm duckit googleit searchit
            echo "Done :("
            echo "
            Sorry To See You Go. You Can Help Me To Improve This.
            You Can Report Any Issue On Github
            Or Directly Contact Me Via Twitter
            Github:     ------
            Twitter:    ------
            "
            }
        else
            {
                echo " Good Decision :) "
            }
        fi
    }

    #   About Function

    function about(){
        echo "
               Searchit
               A Terminal Based Internet Search Customizer
               For Linux Based Operating System
               Author: Mushphyque Tanveer
               Github:  -----
               Twitter: -----
               © 2019
             "
    }

    #   Update Function

    function update(){
        echo "
        This Function Is Not Available Right Now.
        A Tech Savvy Tortoise Currently Working On It.
        "
    }

    # Parameter Checking Function

    function paramCheck() {
        if [ "\$parameter" == '--help' ]  || [ "\$parameter" == '-h' ] || [ "\$parameter" == '-?' ]
            then {
                help
            }
        elif [ "\$parameter" == '--uninstall' ] || [ "\$parameter" == '-un' ]
            then {
                uninstaller
            }
        elif [ "\$parameter" == '--about' ] || [ "\$parameter" == '-a' ]
            then {
                about
            }
        elif [ "\$parameter" == '--update' ] || [ "\$parameter" == '-u' ]
            then {
                update
            }
        elif [ "\$parameter" == '-duckduckgo' ] || [ "\$parameter" == '-ddg' ]
            then {
                duckduckgo
            }
        elif [ "\$parameter" == '-google' ] || [ "\$parameter" == '-ggl' ]
            then {
                google
            }
        else {
            echo "Please Provide A Parameter"
            echo "Ex: \"searchit --help\" or \"searchit -?\" "
            }
        fi
    }

    # Calling Parameter Check Functin For Initialization

    paramCheck
SEARCHITEND
}

#                        Taking User Input For Browser Specification

function browserCheck() {
                echo "Please Select Your Browser:"
                echo " 1 - Firefox"
                echo " 2 - Chrome "
                echo " 3 - Chromium"
                echo " 4 - Opera"
                read browser;
                case $browser in
                        1) var1="firefox" ;;
                        2) var1="google-chrome" ;;
                        3) var1="chromium-browser" ;;
                        4) var1="opera";;
                        *) echo "Please Choose One Of Them"
                                browserCheck ;;
                esac
}

#                         Installer Function

function installer() {
        cd /usr/bin
        createSearchit
        createDuckit
        createGoogleit
        echo "Making Command File Executable"
        chmod 755 duckit googleit searchit
        echo "Done!!!"
        echo "
        If You Like This Tool. You Can Help Me To Improve This.
        Report Any Issue On Github Or Directly Contact Me Via Twitter.
        Or You Can Just Let Me Know That You Liked It.
        It Will Also Help A lot
        Thank You. :D

        Github:     -----
        Twitter:    -----
        "

}

#                         Creating Command File For DuckDuckGo

function createDuckit() {
        echo "Creating DuckDuckGo Command File "
        cat  >> duckit <<DUCKITEND
        #!/usr/bin/env bash
        input="\$@"
        echo \$input > tmp0
        sed -i 's/\ /+/g' tmp0
        query=\$(cat tmp0)
        rm tmp0
        $var1 www.duckduckgo.com/?q=\$query
DUCKITEND
}

#                         Creating Command File For Google

function createGoogleit() {
        echo "Creating Google Command File "
        cat >> googleit <<GOOGLEITEND
        #!/usr/bin/env bash
        input="\$@"
        echo \$input > tmp0
        sed -i 's/\ /+/g' tmp0
        query=\$(cat tmp0)
        rm tmp0
        $var1  https://www.google.com/search?q=\$query
GOOGLEITEND
}

        #                         Checking Root Permission & Intializing

function checkPermission() {
    var0=$(whoami)
    if [  "root" == "$var0"  ]
        then
            {
                browserCheck
                installer
            }
    else
            {
                sudo ./searchit_$version.sh
                var0=root
            }
    fi
}

#                         Calling checkPermission Function For Intializing

checkPermission


#                                               The End
