#!/usr/bin/env bash
######################################################
#                                                    #
#       Searchit                                     #
#       A Terminal Based Internet Seach Customizer   #
#       For Linux Based Operating System             #
#       Author: Mushphyque Tanveer                   #
#       Twitter: www.twitter.com/0xTanveer           #
#                                                    #
######################################################

version=1.0-beta0

#   Creating Command File For Searchit

function createSearchit() {
    echo "Creating Searchit Command File "
    cat  >> searchit <<SEARCHITEND
    #!/usr/bin/env bash
    ######################################################
    #                                                    #
    #       Searchit                                     #
    #       A Terminal Based Internet Seach Customizer   #
    #       For Linux Based Operating System             #
    #       Author: Mushphyque Tanveer                   #
    #       Twitter: www.twitter.com/0xTanveer           #
    #                                                    #
    ######################################################

    version=$version

    #   Assigning Parameter And Query

    parameter="\$1"
    tmpquery="\$@"

    #   Default Browser Read

    function dbCheck() {
        tmpBrowser=\$(cat ~/.searchit.cfg | grep "Browser")
        tmpBrowser=\${tmpBrowser/Default\ Browser:\ }
        tmpBrowser=\${tmpBrowser//\ /+}
        if [ "\$tmpBrowser" == "Firefox" ]
            then {
                browser=firefox
            }
        elif [ "\$tmpBrowser" == "Google+Chrome" ]
            then {
                browser=google-chrome
            }
        elif [ "\$tmpBrowser" == "Opera" ]
            then {
                browser=opera
            }
        elif [ "\$tmpBrowser" == "Chromium" ]
            then {
                browser=chromium-browser
            }
        elif [ "\$tmpBrowser" == "Brave" ]
            then {
                browser=brave-browser
            }
        elif [ "\$tmpBrowser" == "Vivaldi" ]
            then {
                browser=vivaldi
            }
        elif [ "\$tmpBrowser" == "Links" ]
            then {
                browser=links
            }
        elif [ "\$tmpBrowser" == "W3m" ]
            then {
                browser=w3m
            }
        elif [ "\$tmpBrowser" == "Lynx" ]
            then {
                browser=lynx
            }
        else {
            echo " Can't Read Default Settings"
        }
        fi
    }

    #   Default Search Engine Read

    function deCheck() {
        tmpSEngine=\$(cat ~/.searchit.cfg | grep "Default Search")
        tmpSEngine=\${tmpSEngine/Default\ Search\ Engine:\ }
        if [ "\$tmpSEngine" == "DuckDuckGo" ]
            then {
                SEngine="www.duckduckgo.com/?q="
            }
        elif [ "\$tmpSEngine" == "Google" ]
            then {
                SEngine="www.google.com/search?q="
            }
        elif [ "\$tmpSEngine" == "Yahoo" ]
            then {
                SEngine="search.yahoo.com/search?p="
            }
        elif [ "\$tmpSEngine" == "Bing" ]
            then {
                SEngine="www.bing.com/search?q="
            }
        elif [ "\$tmpSEngine" == "Yandex" ]
            then {
                SEngine="yandex.com/search/?text="
            }
        elif [ "\$tmpSEngine" == "Baidu" ]
            then {
                SEngine="www.baidu.com/s?wd="
            }
        elif [ "\$tmpSEngine" == "Startpage" ]
            then {
                SEngine="www.startpage.com/do/search?q="
            }
        elif [ "\$tmpSEngine" == "Searx" ]
            then {
                SEngine="searx.me/?q="
            }
        elif [ "\$tmpSEngine" == "Shodan" ]
            then {
                SEngine="www.shodan.io/search?query="
            }
        else {
            echo " Can't Read Default Settings"
        }
        fi
    }

    #   Default Search function

    function defaultSearch() {
        dbCheck
        deCheck
        query=\${tmpquery//\ /+}
        \$browser \$SEngine\$query
    }

    #   DuckDuckGo Search Fucntion

    function duckduckgo() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ddg+}
        query=\${query/-duckduckgo+}
        \$browser www.duckduckgo.com/?q=\$query
    }

    #   Google Search Fucntion

    function google() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ggl+}
        query=\${query/-google+}
        \$browser www.google.com/search?q=\$query
    }

    #   Yahoo Search Function

    function yahoo() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-yah+}
        query=\${query/-yahoo+}
        \$browser search.yahoo.com/search?p=\$query
    }

    #   Bing Search function

    function bing() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-bng+}
        query=\${query/-bing+}
        \$browser www.bing.com/search?q=\$query
    }

    #   Yandex Search function

    function yandex() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ydx+}
        query=\${query/-yandex+}
        \$browser yandex.com/search/?text=\$query
    }

    #   Baidu Search function

    function baidu() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-bdu+}
        query=\${query/-baidu+}
        \$browser www.baidu.com/s?wd=\$query
    }

    #   Searx Search function

    function searx() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-srx+}
        query=\${query/-searx+}
        \$browser searx.me/?q=\$query
    }

    #   Shodan Search function

    function shodan() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-sdn+}
        query=\${query/-shodan+}
        \$browser www.shodan.io/search?query=\$query
    }

    #   Startpage Search function

    function startpage() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-spg+}
        query=\${query/-startpage+}
        \$browser www.startpage.com/do/search?q=\$query
    }

    #   Facebook Search function

    function facebook() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-fb+}
        query=\${query/-facebook+}
        \$browser www.facebook.com/search?q=\$query
    }

    #   Twitter Search function

    function twitter() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ttr+}
        query=\${query/-twitter+}
        \$browser www.twitter.com/search?q=\$query
    }

    #   Reddit Search function

    function reddit() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-rddt+}
        query=\${query/-reddit+}
        \$browser www.reddit.com/search?q=\$query
    }

    #   LinkedIn Search function

    function linkedin() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-lnkdn+}
        query=\${query/-linkedin+}
        \$browser www.linkedin.com/search?q=\$query
    }

    #   Youtube Search function

    function youtube() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ytb+}
        query=\${query/-youtube+}
        \$browser www.youtube.com/results?q=\$query
    }

    #   Google+ Search function

    function googleplus() {
        dbCheck
        query=\${tmpquery//\ /%20}
        query=\${query/-ggl+%20}
        query=\${query/-googleplus%20}
        \$browser plus.google.com/s/\$query
    }

    #   Pinterest Search function

    function pinterest() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-pntr+}
        query=\${query/-pinterest+}
        \$browser www.pinterest.com/search?q=\$query
    }

    #   Tumblr Search function

    function tumblr() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-tmblr+}
        query=\${query/-tumblr+}
        \$browser www.tumblr.com/search/\$query
    }

    #   Quora Search function

    function quora() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-qra+}
        query=\${query/-quora+}
        \$browser www.quora.com/search?q=\$query
    }

    #   Wikipedia Search function

    function wikipedia() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-wiki+}
        query=\${query/-wikipedia+}
        \$browser www.wikipedia.org/wiki/?search=\$query
    }

    #   Stack Overflow Search function

    function stackoverflow() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-stkof+}
        query=\${query/-stackoverflow+}
        \$browser www.stackoverflow.com/search?q=\$query
    }

    #   Amazon Search function

    function amazon() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-amzn+}
        query=\${query/-amazon+}
        \$browser www.amazon.com/s/?keywords=\$query
    }

    #   Ebay Search function

    function ebay() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-eby+}
        query=\${query/-ebay+}
        \$browser www.ebay.com/sch/i.html?_nkw=\$query
    }

    #   Github Search function

    function github() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-gthb+}
        query=\${query/-github+}
        \$browser www.github.com/search/?q=\$query
    }

    #   Gitlab Search fucntion

    function gitlab() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-gtlb+}
        query=\${query/-gitlab+}
        \$browser www.gitlab.com/search?\&search=\$query
    }

    #   Help Function

    function help() {
        echo "
                    \"Searchit Help Section\"

            Options For Seachit Functionality
                --about     -a          For About Section
                --help      -h    -?    For Help section
                --uninstall -un         For Uninstall
                --update    -u          For Update
                --Version   -v          For Version
                --config    -cfg        For Configuration

                                    Ex: \"searchit --help\"

            Options For Search
                Search Engine
                        -ddg    -duckduckgo     For DuckDuckGo
                        -ggl    -google         For Google
                        -yah    -Yahoo          For Yahoo
                        -bng    -bing           For Bing
                        -ydx    -yandex         For Yandex
                        -bdu    -baidu          For Baidu
                        -spg    -startpage      For Startpage
                        -srx    -searx          For Searx
                        -sdn    -shodan         For Shodan

                Social Media & Others
                        -fb     -facebook       For Facebook
                        -ttr    -twitter        For Twitter
                        -rddt   -reddit         For Reddit
                        -lkndn  -linkedin       For LinkedIn
                        -ytb    -youtube        For Youtube
                        -ggl+   -googleplus     For Google+
                        -pntr   -pinterest      For Pinterest
                        -tmblr  -tumblr         For Tumblr
                        -qra    -quora          For Quora
                        -wiki   -wikipedia      For Wikipedia
                        -stkof  -stackoverflow  For Stack Overflow
                        -amzn   -amazon         For Amazon
                        -eby    -ebay           For Ebay
                        -gthb   -github         For Github
                        -gtlb   -gitlb          For Gitlab

                                    Ex: \"searchit -ddg casino royal\"

            Shortcuts For Searchit
                duckit      For DuckDuckGo
                googleit    For Google

                                    Ex: \"duckit thug life\"
        "
    }

    #   Taking User Input For Browser Specification

    function browserCheck() {
        echo "Please Select Your Browser:"
        echo " 1 - Firefox"
        echo " 2 - Chrome "
        echo " 3 - Chromium"
        echo " 4 - Opera"
        echo " 5 - Brave"
        echo " 6 - Vivaldi"
        echo " 7 - Links (Text Based)"
        echo " 8 - W3m (Text Based)"
        echo " 9 - Lynx (Text Based)"
        read input;
        case \$input in
                1) var1="Firefox" ;;
                2) var1="Google Chrome" ;;
                3) var1="Chromium" ;;
                4) var1="Opera";;
                5) var1="Brave";;
                6) var1="Vivaldi";;
                7) var1="Links";;
                8) var1="W3m" ;;
                9) var1="Lynx" ;;
                *) echo "Please Choose One Of Them"
                        browserCheck ;;
        esac
    }

    #   Taking Input For Default Search Engine Selection

    function defaultEngine() {
        echo "Please Select Your Default Search Engine:"
        echo " 1 - DuckDuckGo"
        echo " 2 - Google"
        echo " 3 - Yahoo"
        echo " 4 - Bing"
        echo " 5 - Yandex"
        echo " 6 - Baidu"
        echo " 7 - Startpage"
        echo " 8 - Searx"
        echo " 9 - Shodan"
        read input;
        case \$input in
            1) var2="DuckDuckGo" ;;
            2) var2="Google" ;;
            3) var2="Yahoo";;
            4) var2="Bing";;
            5) var2="Yandex";;
            6) var2="Baidu";;
            7) var2="Startpage";;
            8) var2="Searx";;
            9) var2="Shodan";;
            *) echo "Please Choose One OF Them"
                    defaultEngine ;;
        esac
    }

    #   Config File Generator

        function config() {
            cat ~/.searchit.cfg | grep "Default"
            echo ""
            echo "Do You Want To Change? (Y/N):"
            read decision;
            if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
            then {
                cd ~
                sudo rm .searchit.cfg
                browserCheck
                defaultEngine
                cat  >> .searchit.cfg <<CONFIGEND
Searchit Configuration File
Please Do Not Edit This File
Use Command "searchit -cfg "
To Change Any Settings

Default Browser: \$var1
Default Search Engine: \$var2
CONFIGEND
            }
            else {
                echo "No Chnage Has Been Made"
            }
            fi
        }

    #   Uninstaller function

    function uninstaller(){
        echo " Do You Really Want To Uninstall Seachit? (Y/N):"
        read decision;
        if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
        then {
            echo "Chainging Directory"
            cd /usr/bin
            sudo rm duckit googleit searchit
            cd ~
            sudo rm .searchit.cfg
            echo "Removing Searchit Related Files"
            uninstallCheck
        }
        else {
                echo " Good Decision :) "
        }
        fi
    }

#   Double Check Uninstall

    function uninstallCheck() {
        if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit.cfg];
        then {
            echo "Uninstalation Failed"
            echo "Report Problem : https://github.com/xCommunicado/Searchit/issues "
        }
        else {
            echo "Done :("
            echo "
            Sorry To See You Go. You Can Help Me To Improve This.
            You Can Report Any Issue On Github
            Or Directly Contact Me Via Twitter
            Github:  https://github.com/xCommunicado/Searchit
            Twitter: https://twitter.com/xCommunicado
            "
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
               Github:  https://github.com/xCommunicado/Searchit
               Twitter: https://twitter.com/xCommunicado
               © 2019
        "
    }

    #   Update Function

    function update(){
        cd ~
        wget https://raw.githubusercontent.com/xCommunicado/Searchit/feature/AutoUpdate/Version
        AvailableVersion=\$(cat Version)
        if [ "\$AvailableVersion" == "\$Version" ]
        then {
            echo "You Are Uptodate"
        }
        else
            {
            echo "Version \$AvailableVersion Is Available. Do You Want To Update?"
            read decision;
            if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
            then {
                sudo rm /usr/bin/searchit /usr/bin/googleit /usr/bin/duckit ~/.searchit.cfg
                wget https://github.com/xCommunicado/Searchit/archive/master.zip
                unzip master.zip
                cd Searchit-master
                ./Searchit_Installer.sh
                rm ~/master.zip
                rm -r ~/Searchit-master
            }
            else {
                    echo " Maybe Later "
            }
            fi
            }
        fi
    rm ~/Version
    }

    # Parameter Checking Function

    function paramCheck() {
        if [ -z \$parameter ];
        then {
            echo "Please Provide A Parameter Or A Search Query"
            echo "Ex: \"searchit --help\" Or \"searchit john wick\""
        }
        else {
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
            elif [ "\$parameter" == '--config' ] || [ "\$parameter" == '-cfg' ]
                then {
                    config
                }
            elif [ "\$parameter" == '--version' ] || [ "\$parameter" == '-v' ]
                then {
                    echo "Seachit Version:\$version"
                }
            elif [ "\$parameter" == '-duckduckgo' ] || [ "\$parameter" == '-ddg' ]
                then {
                    duckduckgo
                }
            elif [ "\$parameter" == '-google' ] || [ "\$parameter" == '-ggl' ]
                then {
                    google
                }
            elif [ "\$parameter" == '-yahoo' ] || [ "\$parameter" == '-yah' ]
                then {
                    yahoo
                }
            elif [ "\$parameter" == '-bing' ] || [ "\$parameter" == '-bng' ]
                then {
                    bing
                }
            elif [ "\$parameter" == '-yandex' ] || [ "\$parameter" == '-ydx' ]
                then {
                    yandex
                }
            elif [ "\$parameter" == '-baidu' ] || [ "\$parameter" == '-bdu' ]
                then {
                    baidu
                }
            elif [ "\$parameter" == '-searx' ] || [ "\$parameter" == '-srx' ]
                then {
                    searx
                }
            elif [ "\$parameter" == '-shodan' ] || [ "\$parameter" == '-sdn' ]
                then {
                    shodan
                }
            elif [ "\$parameter" == '-startpage' ] || [ "\$parameter" == '-spg' ]
                then {
                    startpage
                }
            elif [ "\$parameter" == '-facebook' ] || [ "\$parameter" == '-fb' ]
                then {
                    facebook
                }
            elif [ "\$parameter" == '-twitter' ] || [ "\$parameter" == '-ttr' ]
                then {
                    twitter
                }
            elif [ "\$parameter" == '-reddit' ] || [ "\$parameter" == '-rddt' ]
                then {
                    reddit
                }
            elif [ "\$parameter" == '-linkedin' ] || [ "\$parameter" == '-lnkdn' ]
                then {
                    linkedin
                }
            elif [ "\$parameter" == '-youtube' ] || [ "\$parameter" == '-ytb' ]
                then {
                    youtube
                }
            elif [ "\$parameter" == '-googleplus' ] || [ "\$parameter" == '-ggl+' ]
                then {
                    googleplus
                }
            elif [ "\$parameter" == '-pinterest' ] || [ "\$parameter" == '-pntr' ]
                then {
                    pinterest
                }
            elif [ "\$parameter" == '-tumblr' ] || [ "\$parameter" == '-tmblr' ]
                then {
                    tumblr
                }
            elif [ "\$parameter" == '-quora' ] || [ "\$parameter" == '-qra' ]
                then {
                    quora
                }
            elif [ "\$parameter" == '-wikipedia' ] || [ "\$parameter" == '-wiki' ]
                then {
                    wikipedia
                }
            elif [ "\$parameter" == '-stackoverflow' ] || [ "\$parameter" == '-stkof' ]
                then {
                    stackoverflow
                }
            elif [ "\$parameter" == '-amazon' ] || [ "\$parameter" == '-amzn' ]
                then {
                    amazon
                }
            elif [ "\$parameter" == '-ebay' ] || [ "\$parameter" == '-eby' ]
                then {
                    ebay
                }
            elif [ "\$parameter" == '-github' ] || [ "\$parameter" == '-gthb' ]
                then {
                    github
                }
            elif [ "\$parameter" == '-gitlab' ] || [ "\$parameter" == '-gtlb' ]
                then {
                    gitlab
                }
            else {
                defaultSearch
            }
            fi
        }
    fi
    }

    # Calling Parameter Check Functin For Initialization

    paramCheck

SEARCHITEND
}

#   Installer Function

function installer() {
    cd /usr/bin
    createSearchit
    createDuckit
    createGoogleit
    echo "Making Command Files Executable"
    chmod 755 duckit googleit searchit
}

#   Config File Generator

function configFile() {
        cd ~
        cat  >> .searchit.cfg <<CONFIGEND
Searchit Configuration File
Please Do Not Edit This File
Use Command "searchit -cfg "
To Change Any Settings

Default Browser: Firefox
Default Search Engine: DuckDuckGo
CONFIGEND
    }

#   Double Check Install

function installCheck() {
    if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit.cfg ];
    then {
        echo "Done!!!"
        echo "
            If You Like This Tool. You Can Help Me To Improve This.
            Report Any Issue On Github Or Directly Contact Me Via Twitter.
            Or You Can Just Let Me Know If You Liked It.
            It Will Also Helps A lot
            Thank You. :D
                Github:     -----
                Twitter:    -----
            "
    }
    else {
        echo "Instalation Failed"
        echo "Report Problem : https://github.com/xCommunicado/Searchit/issues "
        }
    fi
}

#   Creating Command File For DuckDuckGo

function createDuckit() {
        echo "Creating DuckDuckGo Command File"
        cat  >> duckit <<DUCKITEND
        #!/usr/bin/env bash
        input="\$@"
        query=\${input//\ /+}
        $var1 www.duckduckgo.com/?q=\$query
DUCKITEND
}

#   Creating Command File For Google

function createGoogleit() {
        echo "Creating Google Command File"
        cat >> googleit <<GOOGLEITEND
        #!/usr/bin/env bash
        input="\$@"
        query=\${input//\ /+}
        $var1  https://www.google.com/search?q=\$query
GOOGLEITEND
}

#   Checking Root Permission & Intializing

function checkPermission() {
    var0=$(whoami)
    if [  "root" == "$var0"  ]
        then {
            installer
            configFile
            installCheck
            searchit --config
        }
    else {
        sudo ./Searchit_Installer.sh
        var0=root
    }
    fi
}

#   Calling checkPermission Function For Intializing

checkPermission

#   The End
