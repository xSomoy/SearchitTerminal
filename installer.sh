#!/usr/bin/env bash
#############################################################
#                                                           #
#     Searchit                                              #
#     Search The Hell Out Of Internet..                     #
#                                                           #
#     Twitter:    www.twitter.com/Tweet2Searchit            #
#     Facebook:   www.facebook.com/SearchitOfficial         #
#     Github:     www.github.com/BlackPearlTech             #
#     Email:      mailtoSearchit@gmail.com                  #
#     License:    GNU General Public License v3.0           #
#                                                           #
#     Author:     John Deadman                                     #
#     Twitter:    www.twitter.com/xSomoy                    #
#                                                           #
#     Copyright © 2020 Black Pearl Tech                     #
#                                                           #
#############################################################

version=$(cat coreModules/version.dat)


# Color Library Start

 bold=`echo -en "\e[1m"`
 underline=`echo -en "\e[4m"`
 dim=`echo -en "\e[2m"`
 strickthrough=`echo -en "\e[9m"`
 blink=`echo -en "\e[5m"`
 reverse=`echo -en "\e[7m"`
 hidden=`echo -en "\e[8m"`
 normal=`echo -en "\e[0m"`
 black=`echo -en "\e[30m"`
 red=`echo -en "\e[31m"`
 green=`echo -en "\e[32m"`
 orange=`echo -en "\e[33m"`
 blue=`echo -en "\e[34m"`
 purple=`echo -en "\e[35m"`
 aqua=`echo -en "\e[36m"`
 gray=`echo -en "\e[37m"`
 darkgray=`echo -en "\e[90m"`
 lightred=`echo -en "\e[91m"`
 lightgreen=`echo -en "\e[92m"`
 lightyellow=`echo -en "\e[93m"`
 lightblue=`echo -en "\e[94m"`
 lightpurple=`echo -en "\e[95m"`
 lightaqua=`echo -en "\e[96m"`
 white=`echo -en "\e[97m"`
 default=`echo -en "\e[39m"`
 BLACK=`echo -en "\e[40m"`
 RED=`echo -en "\e[41m"`
 GREEN=`echo -en "\e[42m"`
 ORANGE=`echo -en "\e[43m"`
 BLUE=`echo -en "\e[44m"`
 PURPLE=`echo -en "\e[45m"`
 AQUA=`echo -en "\e[46m"`
 GRAY=`echo -en "\e[47m"`
 DARKGRAY=`echo -en "\e[100m"`
 LIGHTRED=`echo -en "\e[101m"`
 LIGHTGREEN=`echo -en "\e[102m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 LIGHTBLUE=`echo -en "\e[104m"`
 LIGHTPURPLE=`echo -en "\e[105m"`
 LIGHTAQUA=`echo -en "\e[106m"`
 WHITE=`echo -en "\e[107m"`
 DEFAULT=`echo -en "\e[49m"`

# Color Library End


# colorLibrary End

function dataLoad() {

#  loading Core DAT Files
    echo "${green}Loading coreModules... ${normal}"
    about=$(cat coreModules/about.dat)
    browserSelect=$(cat coreModules/browserSelect.dat)
    config=$(cat coreModules/config.dat)
    connectionTest=$(cat coreModules/connectionTest.dat)
    colorLibrary=$(cat coreModules/colorLibrary.dat)
    defaultBrowserCheck=$(cat coreModules/defaultBrowserCheck.dat)
    defaultSearch=$(cat coreModules/defaultSearch.dat)
    defaultSearchEngineCheck=$(cat coreModules/defaultSearchEngineCheck.dat)
    duckit=$(cat coreModules/duckit.dat)
    globalVariable=$(cat coreModules/globalVariable.dat)
    googleit=$(cat coreModules/googleit.dat)
    help=$(cat coreModules/help.dat)
    init=$(cat coreModules/init.dat)
    intro=$(cat coreModules/intro.dat)
    paramCheck=$(cat coreModules/paramCheck.dat)
    searchengineSelect=$(cat coreModules/searchengineSelect.dat)
    uninstall=$(cat coreModules/uninstall.dat)
    uninstallCheck=$(cat coreModules/uninstallCheck.dat)
    update=$(cat coreModules/update.dat)
    updateCheck=$(cat coreModules/updateCheck.dat)


# Loading Search Engine DAT Files
    echo "${green}Loading searchModules... ${normal}"
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
# updateCheck.dat
# defaultBrowserCheck.dat
# defaultSearch.dat
    echo "${green}Creating Searchit Terminal Core...${normal}"
    echo "$intro" >> searchit   t
    echo "version=$version" >> searchit
    echo "$globalVariable" >> searchit
    echo "$colorLibrary" >> searchit
    echo "$updateCheck" >> searchit
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
# connectionTest.dat
# paramCheck.dat
# init.dat

    echo "$help" >> searchit
    echo "$browserSelect" >> searchit
    echo "$searchengineSelect" >> searchit
    echo "$config" >> searchit
    echo "$uninstall" >> searchit
    echo "$uninstallCheck" >> searchit
    echo "$about" >> searchit
    echo "$update" >> searchit
    echo "$connectionTest" >> searchit
    echo "$paramCheck" >> searchit
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
      echo "${green}Generating resource.. ${normal}"
        sudo cp resource/SearchitTerminal.desktop /usr/share/applications/
        sudo chmod 777 /usr/share/applications/SearchitTerminal.desktop
        sudo mkdir /usr/share/icons/SearchitTerminal/
        cp resource/SearchitTerminal.png /usr/share/icons/SearchitTerminal/
        mkdir ~/.searchit/
        chmod 777 ~/.searchit/
        cp resource/logo ~/.searchit/
        cp resource/releaseNote ~/.searchit/
        cp resource/README.txt ~/.searchit/
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
    if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit/searchit.cfg ] && [ -f ~/.searchit/releaseNote ] && [ -f /usr/share/applications/SearchitTerminal.desktop ] && [ -f /usr/share/icons/SearchitTerminal/SearchitTerminal.png ] && [ -f ~/.searchit/logo ]
    then {
        cd ~
        ./.searchit/logo
        echo "
    ${green}${bold}Instalation Complete!!!${normal}${default}

    ${aqua}If You Like This Software. You Can Help Me To Improve This.
    Report Any Issue On Github Or Directly Contact Me Via Twitter.
    Or You Can Just Let Me Know If You Liked It. That Also Helps A lot.
    Thank You. :D ${normal} ${blue}
        Twitter:    https://twitter.com/Tweet2Searchit
        Facebook:   https://facebook.com/BlackPearlTechOfficial
        Github:     https://github.com/BlackPearlTech
        Email:      mailtoSearchit@gmail.com ${normal}

           ${bold}${WHITE}${black}Copyright © 2020 Black Pearl Tech${normal}
            "
    }
    else {
        echo "${red}${bold}Instalation Failed"
        echo "Report Problem : https://github.com/BlackPearlTech/SearchitTerminal/issues${normal}${default}"
        }
    fi

    if [ -f ~/.sudo_as_admin_successful ]
    then {
       rm ~/.sudo_as_admin_successful
    }
    fi
    if [ -f ~/.wget-hsts ]
    then {
       rm ~/.wget-hsts
    }
    fi
}

# Creating Command File For DuckDuckGo

function createDuckit() {
    touch duckit

# /coreModules/duckit.dat
    echo "$intro"  >> duckit
    echo "$connectionTest" >> duckit
    echo "$duckit" >> duckit
}

#   Creating Command File For Google

function createGoogleit() {
      touch googleit

# /coreModules/googleit.dat
      echo "$intro"  >> googleit
      echo "$connectionTest" >> googleit
      echo "$googleit" >>googleit
}

#   Uninstalling If Older Version of Searchit Terminal is already installed
function oldversionCheck() {
  echo "${blue}Checking If Older Version Of Searchit Exist...${normal}"
  sleep 1s
  if [ -f /usr/bin/searchit ] || [ -f /usr/bin/googleit ] || [ -f /usr/bin/duckit ] || [ -f /usr/share/applications/st.desktop ] || [ -d ~/.searchit ] || [ -d /usr/share/icons/SearchitTerminal ] || [ -f /usr/share/applications/SearchitTerminal.desktop ]
      then {
              echo "${orange}Older Version Of Searchit Terminal Is Found"
              sleep 1s
              echo "Removing Old Version Files..."
              sleep 1s
              sudo rm /usr/bin/searchit /usr/bin/googleit /usr/bin/duckit
              sudo rm /usr/share/applications/SearchitTerminal.desktop
              sudo rm -r /usr/share/icons/SearchitTerminal
              sudo rm -r ~/.searchit
              echo "Old Version Of Searchit Terminal Removed${normal}"
              sleep 1s
              echo "${green}Installing Newer Version Of Searchit Terminal${normal}"
              sleep 1s
              dataLoad
          }
      else {
              echo "${green}No Older Version of Searchit Terminal Found"
              sleep 1s
              clear
              echo "Installing Newer Version Of Searchit Terminal${normal}"
                dataLoad
          }
      fi
}
# Checking Root Permission & Intializing

function checkPermission() {
    var0=$(whoami)
    if [  "root" == "$var0"  ]
        then {
            ./resource/logo
            oldversionCheck
            dataGen
            installer
            echo "${green}Searchit Terminal Configuration Process..."
            echo "${normal}"
            echo "${bold}${green}Select Your Default Browser and Search Engine:${normal}${default}"
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

checkPermission

# The End
