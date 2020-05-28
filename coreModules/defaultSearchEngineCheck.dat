#   Default Search Engine Check

function deCheck() {
    tmpSEngine=$(cat ~/.config/SearchitTerminal/searchit.cfg | grep "Default Search")
    tmpSEngine=${tmpSEngine/Default\ Search\ Engine:\ }
    if [ "$tmpSEngine" == "DuckDuckGo" ]
        then {
            SEngine="www.duckduckgo.com/?q="
        }
    elif [ "$tmpSEngine" == "Google" ]
        then {
            SEngine="www.google.com/search?q="
        }
    elif [ "$tmpSEngine" == "Yahoo" ]
        then {
            SEngine="search.yahoo.com/search?p="
        }
    elif [ "$tmpSEngine" == "Bing" ]
        then {
            SEngine="www.bing.com/search?q="
        }
    elif [ "$tmpSEngine" == "Yandex" ]
        then {
            SEngine="yandex.com/search/?text="
        }
    elif [ "$tmpSEngine" == "Baidu" ]
        then {
            SEngine="www.baidu.com/s?wd="
        }
    elif [ "$tmpSEngine" == "Startpage" ]
        then {
            SEngine="www.startpage.com/do/search?q="
        }
    elif [ "$tmpSEngine" == "Searx" ]
        then {
            SEngine="searx.me/?q="
        }
    elif [ "$tmpSEngine" == "Shodan" ]
        then {
            SEngine="www.shodan.io/search?query="
        }
    else {
        echo "${orange}${blink}ERROR:Unable To Read Default Settings${normal}"
    }
    fi
}
