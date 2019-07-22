#!/usr/bin/env bash
######################################################
#                                                    #
#     Searchit                                       #
#     Terminal Based Search Customizer               #
#                                                    #
#     Facebook:   www.facebook.com/SearchitApp       #
#     License:    GNU General Public License v3.0    #
#                                                    #
#     Author:     xSomoy                             #
#     Twitter:    www.twitter.com/xSomoy             #
#     Github:     www.github.com/xSomoy              #
#                                                    #
#     Copyright © 2019 Mushphyqur Rahman Tanveer     #
#                                                    #
######################################################

version=2.1.5


# /core

# Intro.dat
    version=$version
#globalVariable.dat
#defaultBrowserCheck.dat
#defaultSearch.dat

# /modules/searchEngines

#duckduckgo.dat
#google.dat
#yahoo.dat
#yandex.dat
#bing.dat
#searx.dat
#baidu.dat
#shodan.dat
#startpage.dat

# /modules/searchSites

#facebook.dat
#twitter.dat
#reddit.dat
#linkedin.dat
#youtube.dat
#pinterest.dat
#tumblr.dat
#quora.dat
#wikipedia.dat
#stackoverflow.dat
#amazon.dat
#ebay.dat
#github.dat
#gitlab.dat

# /core

#help.dat
#browserSelect.dat
#searchengineSelect.dat
#config.dat
#uninstall.dat
#uninstallCheck.dat
#about.dat
#update.dat
#parameterCheck.dat
#init.dat


#   Installer Function

function installer() {
    cd /usr/bin
    createSearchit
    createDuckit
    createGoogleit
    chmod 755 duckit googleit searchit
}

#   Searchit Folder And Files Genrator

function dataGen() {
        mkdir ~/.searchit/
        chmod 777 ~/.searchit/
        cp Release-Note ~/.searchit/
        cp README.txt ~/.searchit/
        cd ~/.searchit
        cat  >> searchit.cfg <<CONFIGEND
Searchit Configuration File.
Please Do Not Make Any Change To This File.
Use Command "searchit -cfg" To Make Any Changes
----------------------------------

Default Browser: Firefox
Default Search Engine: DuckDuckGo
CONFIGEND
    }

#   Double Check Install

function installCheck() {
    if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit/searchit.cfg ] && [ -f ~/.searchit/Release-Note ];
    then {
        echo "
            Instalation Complete!!

            If You Like This Software. You Can Help Me To Improve This.
            Report Any Issue On Github Or Directly Contact Me Via Twitter.
            Or You Can Just Let Me Know If You Liked It. That Also Helps A lot.
            Thank You. :D
                Facebook:   Https://facebook.com/SearchitApp
                Github:     https://github.com/xSomoy
                Twitter:    https://twitter.com/xSomoy
            "
    }
    else {
        echo "Instalation Failed"
        echo "Report Problem : https://github.com/xSomoy/Searchit/issues "
        }
    fi
}

#   Creating Command File For DuckDuckGo

function createDuckit() {
        cat  >> duckit <<DUCKITEND
# /core/duckit.dat

DUCKITEND
}

#   Creating Command File For Google

function createGoogleit() {
        cat >> googleit <<GOOGLEITEND
#/core/googleit.dat
GOOGLEITEND
}
#   Checking Root Permission & Intializing

function checkPermission() {
    var0=$(whoami)
    if [  "root" == "$var0"  ]
        then {
            dataGen
            installer
            echo "Searchit Installation Process..."
            echo "Select You Default Configuration:"
            echo ""
            searchit --config
            installCheck
        }
    else {
        sudo ./installer.sh
        var0=root
    }
    fi
}

#   Calling checkPermission Function For Intializing

checkPermission

#   The End
