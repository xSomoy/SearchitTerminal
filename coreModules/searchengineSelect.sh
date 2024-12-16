#   Default Search Engine Specifier

function defaultEngine() {
    echo "${blue}${bold}Please Select Your Default Search Engine:${normal}"
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
    case $input in
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
