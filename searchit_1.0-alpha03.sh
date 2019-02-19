#!/usr/bin/env bash
#
#       Searchit
#       A Terminal Based Internet Seach Customizer
#       For Linux Based Operating System
#       Author: Mushphyque Tanveer
#
###################################################

version=1.0-alpha03

#   Creating Command File For Seatchit

function createSearchit() {
    echo "Creating Searchit Command File "
    cat  >> searchit <<SEARCHITEND
    #!/usr/bin/env bash

    #   Assigning Parameter And Query
    parameter="\$1"
    tmpquery="\$@"

    #   Default Search function

    function defaultSearch() {
        query=\${tmpquery//\ /+}
        $var1 $var2\$query
    }

    # DuckDuckGo Search Fucntion

    function duckduckgo() {
        query=\${tmpquery//\ /+}
        query=\${query/-ddg+}
        query=\${query/-duckduckgo+}
        $var1 www.duckduckgo.com/?q=\$query
    }

    # Google Search Fucntion

    function google() {
        query=\${tmpquery//\ /+}
        query=\${query/-ggl+}
        query=\${query/-google+}
        $var1 www.google.com/search?q=\$query
    }

    #   Yahoo Search Function

    function yahoo() {
        query=\${tmpquery//\ /+}
        query=\${query/-yah+}
        query=\${query/-yahoo+}
        $var1 search.yahoo.com/search?p=\$query
    }

    # Bing Search function

    function bing() {
        query=\${tmpquery//\ /+}
        query=\${query/-bng+}
        query=\${query/-bing+}
        $var1 www.bing.com/search?q=\$query
    }

    # Yandex Search function

    function yandex() {
        query=\${tmpquery//\ /+}
        query=\${query/-ydx+}
        query=\${query/-yandex+}
        $var1 yandex.com/search/?text=\$query
    }

    # Baidu Search function

    function baidu() {
        query=\${tmpquery//\ /+}
        query=\${query/-bdu+}
        query=\${query/-baidu+}
        $var1 www.baidu.com/s?wd=\$query
    }

    # Searx Search function

    function searx() {
        query=\${tmpquery//\ /+}
        query=\${query/-srx+}
        query=\${query/-searx+}
        $var1 searx.me/?q=\$query
    }

    # Shodan Search function

    function shodan() {
        query=\${tmpquery//\ /+}
        query=\${query/-sdn+}
        query=\${query/-shodan+}
        $var1 www.shodan.io/search?query=\$query
    }

    # Startpage Search function

    function startpage() {
        query=\${tmpquery//\ /+}
        query=\${query/-spg+}
        query=\${query/-startpage+}
        $var1 www.startpage.com/do/search?q=\$query
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

                                    Ex: \"searchit --help\"

            Options For Search
                Search Engines
                        -ddg    -duckduckgo     For DuckDuckGo
                        -ggl    -google         For Google
                        -yah    -Yahoo          For Yahoo
                        -bng    -bing           For Bing
                        -ydx    -yandex         For Yandex
                        -bdu    -baidu          For Baidu
                        -spg    -startpage      For Startpage
                        -srx    -searx          For Searx
                        -sdn    -shodan         For Shodan

                                    Ex: \"searchit -ddg casino royal\"

            Shortcuts For Searchit
                duckit      For DuckDuckGo
                googleit    For Google

                                    Ex: \"duckit thug life\"
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
            sudo rm duckit googleit searchit
            echo "Removing Searchit Related Files"
            echo "Done :("
            echo "
            Sorry To See You Go. You Can Help Me To Improve This.
            You Can Report Any Issue On Github
            Or Directly Contact Me Via Twitter
            Github:     ------
            Twitter:    ------
            "
        }
        else {
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
        This Feature Is Not Available Right Now.
        A Tech Savvy Tortoise Currently Working On It.
        "
    }

    # Parameter Checking Function

    function paramCheck() {
        if [ -z \$parameter ];
        then
            {
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
            elif [ "\$parameter" == '--version' ] || [ "\$parameter" == '-v' ]
                then {
                    echo "Seachit Version:$version"
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
    read browser;
    case $browser in
            1) var1="firefox" ;;
            2) var1="google-chrome" ;;
            3) var1="chromium-browser" ;;
            4) var1="opera";;
            5) var1="brave-browser";;
            6) var1="vivaldi";;
            7) var1="links";;
            8) var1="w3m" ;;
            9) var1="lynx" ;;
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
    read engine;
    case $engine in
        1) var2="www.duckduckgo.com/?q=" ;;
        2) var2="www.google.com/search?q=" ;;
        3) var2="search.yahoo.com/search?p=";;
        4) var2="www.bing.com/search?q=";;
        5) var2="yandex.com/search/?text=";;
        6) var2="www.baidu.com/s?wd=";;
        7) var2="www.startpage.com/do/search?q=";;
        8) var2="searx.me/?q=";;
        9) var2="www.shodan.io/search?query=";;
        *) echo "Please Choose One OF Them"
                defaultEngine ;;
    esac
}

#   Installer Function

function installer() {
    cd /usr/bin
    createSearchit
    createDuckit
    createGoogleit
    echo "Making Command Files Executable"
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
            browserCheck
            defaultEngine
            installer
        }
    else {
        sudo ./searchit_$version.sh
        var0=root
    }
    fi
}

#   Calling checkPermission Function For Intializing

checkPermission

#   The End
