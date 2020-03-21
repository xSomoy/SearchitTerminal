#!/usr/bin/env bash
######################################################
#                                                    #
#     Searchit                                       #
#     Search The Hell Out Of Internet..              #
#                                                    #
#     Twitter:    www.twitter.com/Tweet2Searchit     #
#     Facebook:   www.facebook.com/SearchitOfficial  #
#     Github:     www.github.com/SearchitOfficial    #
#     Email:      mailtoSearchit@gmail.com           #
#     License:    GNU General Public License v3.0    #
#                                                    #
#     Author:     Somoy                              #
#     Twitter:    www.twitter.com/xSomoy             #
#                                                    #
#     Copyright © 2019 Mushphyqur Rahman Tanveer     #
#                                                    #
######################################################

version=2.8.1


function dataLoad() {

#  loading Core DAT Files

    about=$(cat coreModules/about.dat)
    browserSelect=$(cat coreModules/browserSelect.dat)
    config=$(cat coreModules/config.dat)
    defaultBrowserCheck=$(cat coreModules/defaultBrowserCheck.dat)
    defaultSearch=$(cat coreModules/defaultSearch.dat)
    defaultSearchEngineCheck=$(cat coreModules/defaultSearchEngineCheck.dat)
    duckit=$(cat coreModules/duckit.dat)
    globalVariable=$(cat coreModules/globalVariable.dat)
    googleit=$(cat coreModules/googleit.dat)
    help=$(cat coreModules/help.dat)
    init=$(cat coreModules/init.dat)
    intro=$(cat coreModules/intro.dat)
    engineCheck=$(cat coreModules/engineCheck.dat)
    searchengineSelect=$(cat coreModules/searchengineSelect.dat)
    uninstall=$(cat coreModules/uninstall.dat)
    uninstallCheck=$(cat coreModules/uninstallCheck.dat)
    update=$(cat coreModules/update.dat)


# Loading Search Engine DAT Files

    baidu=$(cat searchModules/searchEngines/baidu.dat)
    bing=$(cat searchModules/searchEngines/bing.dat)
    duckduckgo=$(cat searchModules/searchEngines/duckduckgo.dat)
    dogpile=$(cat searchModules/searchEngines/dogpile.dat)
    google=$(cat searchModules/searchEngines/google.dat)
    ecosia=$(cat searchModules/searchEngines/ecosia.dat)
    qwant=$(cat searchModules/searchEngines/qwant.dat)
    qwantjr=$(cat searchModules/searchEngines/qwantjr.dat)
    searx=$(cat searchModules/searchEngines/searx.dat)
    shodan=$(cat searchModules/searchEngines/shodan.dat)
    startpage=$(cat searchModules/searchEngines/startpage.dat)
    yahoo=$(cat searchModules/searchEngines/yahoo.dat)
    yandex=$(cat searchModules/searchEngines/yandex.dat)
    yippy=$(cat searchModules/searchEngines/yippy.dat)
    wolframalpha=$(cat searchModules/searchEngines/wolframalpha.dat)

# Loading Search Site DAT Files

    amazon=$(cat searchModules/searchSites/amazon.dat)
    ebay=$(cat searchModules/searchSites/ebay.dat)
    facebook=$(cat searchModules/searchSites/facebook.dat)
    github=$(cat searchModules/searchSites/github.dat)
    gitlab=$(cat searchModules/searchSites/gitlab.dat)
    linkedin=$(cat searchModules/searchSites/linkedin.dat)
    pinterest=$(cat searchModules/searchSites/pinterest.dat)
    quora=$(cat searchModules/searchSites/quora.dat)
    reddit=$(cat searchModules/searchSites/reddit.dat)
    stackoverflow=$(cat searchModules/searchSites/stackoverflow.dat)
    tumblr=$(cat searchModules/searchSites/tumblr.dat)
    twitter=$(cat searchModules/searchSites/twitter.dat)
    wikipedia=$(cat searchModules/searchSites/wikipedia.dat)
    youtube=$(cat searchModules/searchSites/youtube.dat)
    drugs=$(cat searchModules/searchSites/drugs.dat)

        checkPermission

}

function createSearchit() {
    touch searchit

# Core Modules Need To Execute In Right Order.
# Do Not Change Their Order.
#
#               [ /coreModules ]
#
# Intro.dat
# write version
# globalVariable.dat
# defaultBrowserCheck.dat
# defaultSearch.dat

    echo "$intro" >> searchit   t
    echo "version=$version" >> searchit
    echo "$globalVariable" >> searchit
    echo "$defaultBrowserCheck" >> searchit
    echo "$defaultSearchEngineCheck" >> searchit
    echo "$defaultSearch" >> searchit


# Search Engies Modules Are Sorted Alphanumerically
# No Specific Order Necessary For Working Properly
#
#         [ /searchModules/searchEngines ]
#

    echo "$baidu" >> searchit
    echo "$bing" >> searchit
    echo "$duckduckgo" >> searchit
    echo "$dogpile" >> searchit
    echo "$google" >> searchit
    echo "$ecosia" >> searchit
    echo "$qwant" >> searchit
    echo "$qwantjr" >> searchit
    echo "$searx" >> searchit
    echo "$shodan" >> searchit
    echo "$startpage" >> searchit
    echo "$yahoo" >> searchit
    echo "$yandex" >> searchit
    echo "$yippy" >> searchit
    echo "$wolframpalha" >> searchit
    echo "$drugs" >> searchit


# Search Site Modules Are Sorted Alphanumerically
# No Specific Order Necessary For Working Properly
#
#         [ /searchModules/searchEngines ]
#

    echo "$amazon" >> searchit
    echo "$ebay" >> searchit
    echo "$facebook" >> searchit
    echo "$github" >> searchit
    echo "$gitlab" >> searchit
    echo "$linkedin" >> searchit
    echo "$pinterest" >> searchit
    echo "$quora" >> searchit
    echo "$reddit" >> searchit
    echo "$stackoverflow" >> searchit
    echo "$tumblr" >> searchit
    echo "$twitter" >> searchit
    echo "$wikipedia" >> searchit
    echo "$youtube" >> searchit


# Core Modules Need To Execute In Right Order.
# Do Not Change Their Order.
#
#               [ /coreModules ]
#
# help.dat
# browserSelect.dat
# searchengineSelect.dat
# config.dat
# uninstall.dat
# uninstallCheck.dat
# about.dat
# update.dat
# engineCheck.dat
# init.dat

    echo "$help" >> searchit
    echo "$browserSelect" >> searchit
    echo "$searchengineSelect" >> searchit
    echo "$config" >> searchit
    echo "$uninstall" >> searchit
    echo "$uninstallCheck" >> searchit
    echo "$about" >> searchit
    echo "$update" >> searchit
    echo "$engineCheck" >> searchit
    echo "$init" >> searchit

}
# Installer Function

function installer() {
    cd /usr/bin
    createSearchit
    createDuckit
    createGoogleit
    chmod 755 duckit googleit searchit
}

# Searchit Folder And Files Genrator

function dataGen() {
        mkdir ~/.searchit/
        chmod 777 ~/.searchit/
        cp docs/releaseNote ~/.searchit/
        cp docs/README.txt ~/.searchit/
        cp docs/logo ~/.searchit/
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

# Double Check Install

function installCheck() {
    if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit/searchit.cfg ] && [ -f ~/.searchit/releaseNote ];
    then {
        echo "
            Instalation Complete!!

            If You Like This Software. You Can Help Me To Improve This.
            Report Any Issue On Github Or Directly Contact Me Via Twitter.
            Or You Can Just Let Me Know If You Liked It. That Also Helps A lot.
            Thank You. :D
                Twitter:    https://twitter.com/Tweet2Searchit
                Facebook:   https://facebook.com/SearchitOfficial
                Github:     https://github.com/SearchitOfficial
                Email:      mailtoSearchit@gmail.com
            "
    }
    else {
        echo "Instalation Failed"
        echo "Report Problem : https://github.com/searchitofficial/SearchitTerminal/issues"
        }
    fi
}

# Creating Command File For DuckDuckGo

function createDuckit() {
    touch duckit

# /coreModules/duckit.dat
    echo "$intro"  >> duckit
    echo "$duckit" >> duckit
}

#   Creating Command File For Google

function createGoogleit() {
      touch googleit

# /coreModules/googleit.dat
      echo "$intro"  >> googleit
      echo "$googleit" >>googleit
}

# Checking Root Permission & Intializing

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
        sudo chmod +x installer.sh
        sudo ./installer.sh
        var0=root
    }
    fi
}

# Calling dataLoad Fucntion For Loading Essential Data

  dataLoad

# The End
