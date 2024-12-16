# Testing Connection To Internet

function connectionTest () {
    wget --spider -q google.com
    if [ "$?" != 0 ]
    then {
    echo "${red}${blink}${bold}Error: You Are Not Connected To The Internet!!${normal}"
        if [ -f ~/.wget-hsts ]
        then {
           rm ~/.wget-hsts
        }
        fi
    exit
    }
    fi
    if [ -f ~/.wget-hsts ]
    then {
       rm ~/.wget-hsts
    }
    fi
}
