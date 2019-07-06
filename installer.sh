#!/usr/bin/env bash
######################################################
#                                                    #
#       Searchit                                     #
#       Terminal Based Search Customizer             #
#                                                    #
#       Author:     xCommunicado                     #
#       Twitter:    www.twitter.com/xCommunicado     #
#       License:    GNU General Public License v3.0  #
#                                                    #
######################################################

version=1.1.3

#   Creating Searchit Command

function createSearchit() {
    cat  >> searchit <<SEARCHITEND
    #!/usr/bin/env bash
    ######################################################
    #                                                    #
    #       Searchit                                     #
    #       Terminal Based Search Customizer             #
    #                                                    #
    #       Author:     xCommunicado                     #
    #       Twitter:    www.twitter.com/xCommunicado     #
    #       License:    GNU General Public License v3.0  #
    #                                                    #
    ######################################################

    version=$version

    #   Assigning Parameter And Search Query

    parameter="\$1"
    opParam="\$2"
    tmpquery="\$@"

    #   Default Browser Check

    function dbCheck() {
        tmpBrowser=\$(cat ~/.searchit/searchit.cfg | grep "Browser")
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
            echo "ERROR: Unable to read configuration file"
        }
        fi
    }

    #   Default Search Engine Check

    function deCheck() {
        tmpSEngine=\$(cat ~/.searchit/searchit.cfg | grep "Default Search")
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

    #   Default Search Function

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
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="&iax=images&ia=images"
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="&iax=videos&ia=videos"
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              option="&iar=news&ia=news"
        }
      elif [ "\$opParam" == '-meanings' ] || [ "\$opParam" == '-mns' ]
            then {
              query=\${query/-mns+}
              query=\${query/-meanings+}
              option="&ia=meanings"
        }
      elif [ "\$opParam" == '-answer' ] || [ "\$opParam" == '-ans' ]
            then {
              query=\${query/-ans+}
              query=\${query/-answer+}
              option="&ia=answer"
        }
      elif [ "\$opParam" == '-nutrition' ] || [ "\$opParam" == '-ntr' ]
              then {
                query=\${query/-ntr+}
                query=\${query/-nutrition+}
                option="&ia=nutrition"
        }
      elif [ "\$opParam" == '-recipes' ] || [ "\$opParam" == '-rcp' ]
              then {
                query=\${query/-rcp+}
                query=\${query/-recipes+}
                option="&ia=recipes"
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " DuckDuckGo Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
                    For Meanings   -meanings    -mns
                    For Answer     -answer      -ans
                    For Nutrition  -nutrition   -ntr
                    For Recipes    -recipes     -rcp
            "
            exit
      }
        else {
              option=""
        }
      fi
      query=\${query/-ddg+}
      query=\${query/-duckduckgo+}
      \$browser www.duckduckgo.com/?q=\$query\$option
    }

    #   Google Search Fucntion

    function google() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="&tbm=isch"
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="&tbm=vid"
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              option="&tbm=nws"
        }
      elif [ "\$opParam" == '-books' ] || [ "\$opParam" == '-bks' ]
            then {
              query=\${query/-bks+}
              query=\${query/-books+}
              option="&tbm=bks"
        }
      elif [ "\$opParam" == '-finance' ] || [ "\$opParam" == '-fnc' ]
            then {
              query=\${query/-fnc+}
              query=\${query/-finance+}
              option="&tbm=fin"
        }
      elif [ "\$opParam" == '-maps' ] || [ "\$opParam" == '-map' ]
              then {
                query=\${query/-map+}
                query=\${query/-maps+}
                query=\${query/-ggl+}
                query=\${query/-google+}
                \$browser www.google.com/maps?q=\$query
              exit
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Google Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
                    For Books      -books       -bks
                    For Finance    -finance     -fnc
                    For Maps       -maps        -map
            "
            exit
      }
        else {
              option=""
        }
      fi
        query=\${query/-ggl+}
        query=\${query/-google+}
        \$browser www.google.com/search?q=\$query\$option
    }

    #   Yahoo Search Function

    function yahoo() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="images/search?q="
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="/search/videos?q="
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              option="news/search?q="
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Yahoo Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
            "
            exit
      }
        else {
              option="search?q="
        }
      fi
        query=\${query/-yah+}
        query=\${query/-yahoo+}
        \$browser search.yahoo.com/\$option\$query
    }

    #   Bing Search Function

    function bing() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="images/search?q="
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="videos/search?q="
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              option="news/search?q="
        }
      elif [ "\$opParam" == '-maps' ] || [ "\$opParam" == '-map' ]
              then {
                query=\${query/-map+}
                query=\${query/-maps+}
                option="maps/search?q="
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Bing Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
                    For Maps       -maps        -map
            "
            exit
      }
        else {
              option="search?q="
        }
      fi
        query=\${query/-bng+}
        query=\${query/-bing+}
        \$browser www.bing.com/\$option\$query
    }

    #   Yandex Search Function

    function yandex() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="images/search?text="
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="video/search?text="
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              query=\${query/-ydx+}
              query=\${query/-yandex+}
              \$browser news.yandex.com/yandsearch?rpt=news\&text=\$query
              exit

        }
      elif [ "\$opParam" == '-maps' ] || [ "\$opParam" == '-map' ]
              then {
                query=\${query/-map+}
                query=\${query/-maps+}
                option="maps/?text="
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Yandex Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
                    For Maps       -maps        -map
            "
            exit
      }
        else {
              option="search/?text="
        }
      fi
        query=\${query/-ydx+}
        query=\${query/-yandex+}
        \$browser yandex.com/\$option\$query
    }

    #   Baidu Search Function

    function baidu() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              query=\${query/-bdu+}
              query=\${query/-baidu+}
              \$browser image.baidu.com/search/index?tn=baiduimage\&word=\$query
              exit
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              query=\${query/-bdu+}
              query=\${query/-baidu+}
              \$browser www.baidu.com/sf/vsearch?pd=video\&wd=\$query
              exit
        }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              query=\${query/-bdu+}
              query=\${query/-baidu+}
              \$browser baidu.com/s?rtt=1\&word=\$query
              exit

        }
      elif [ "\$opParam" == '-maps' ] || [ "\$opParam" == '-map' ]
              then {
                query=\${query/-map+}
                query=\${query/-maps+}
                query=\${query/-bdu+}
                query=\${query/-baidu+}
                \$browser map.baidu.com/search/?querytype=s\&wd=\$query
                exit
        }
      elif [ "\$opParam" == '-academic' ] || [ "\$opParam" == '-aca' ]
              then {
                query=\${query/-aca+}
                query=\${query/-academic+}
                query=\${query/-bdu+}
                query=\${query/-baidu+}
                \$browser xueshu.baidu.com/s?wd=\$query
                exit
        }
      elif [ "\$opParam" == '-music' ] || [ "\$opParam" == '-msc' ]
              then {
                query=\${query/-msc+}
                query=\${query/-music+}
                query=\${query/-bdu+}
                query=\${query/-baidu+}
                \$browser music.taihe.com/search?key=\$query
                exit
        }
      elif [ "\$opParam" == '-know' ] || [ "\$opParam" == '-knw' ]
              then {
                query=\${query/-knw+}
                query=\${query/-know+}
                query=\${query/-bdu+}
                query=\${query/-baidu+}
                \$browser zhidao.baidu.com/search?word=\$query
                exit
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Baidu Search Filters:
                    For Images     -image       -img
                    For Videos     -Videos      -vid
                    For News       -news        -nws
                    For Maps       -maps        -map
                    For Music      -music       -msc
                    For Academic   -academic    -aca
                    For Know       -know        -knw
            "
            exit
      }
        else {
          query=\${query/-bdu+}
          query=\${query/-baidu+}
          \$browser www.baidu.com/s?wd=\$query
          exit
        }
      fi
    }

    #   Searx Search Function

    function searx() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-images' ]  || [ "\$opParam" == '-img' ]
            then {
              query=\${query/-img+}
              query=\${query/-images+}
              option="images"
            }
        elif [ "\$opParam" == '-videos' ] || [ "\$opParam" == '-vid' ]
            then {
              query=\${query/-vid+}
              query=\${query/-videos+}
              option="videos"
        }
      elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
            then {
              query=\${query/-nws+}
              query=\${query/-news+}
              option="news"
        }
      elif [ "\$opParam" == '-files' ] || [ "\$opParam" == '-fls' ]
            then {
              query=\${query/-fls+}
              query=\${query/-files+}
              option="files"
        }
      elif [ "\$opParam" == '-it' ]
            then {
              query=\${query/-it+}
              option="it"
        }
      elif [ "\$opParam" == '-maps' ] || [ "\$opParam" == '-map' ]
              then {
                query=\${query/-map+}
                query=\${query/-maps+}
                option="map"
        }
      elif [ "\$opParam" == '-music' ] || [ "\$opParam" == '-msc' ]
              then {
                query=\${query/-msc+}
                query=\${query/-music+}
                option="music"
        }
      elif [ "\$opParam" == '-science' ] || [ "\$opParam" == '-sci' ]
              then {
                query=\${query/-sci+}
                query=\${query/-science+}
                option="science"
        }
      elif [ "\$opParam" == '-social' ] || [ "\$opParam" == '-scl' ]
              then {
                query=\${query/-scl+}
                query=\${query/-social+}
                option="social+media"
        }

      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Searx Search Filters:
                    For Images        -image       -img
                    For Videos        -Videos      -vid
                    For News          -news        -nws
                    For Files         -files       -fls
                    For It            -it
                    For Maps          -maps        -map
                    For Music         -music       -msc
                    For Science       -science     -sci
                    For Social Media  -social      -scl
            "
            exit
      }
        else {
              option="general"
        }
      fi
        query=\${query/-srx+}
        query=\${query/-searx+}
        \$browser searx.me/?q=\$query\&categories=\$option
    }

    #   Shodan Search Function

    function shodan() {
        dbCheck
        query=\${tmpquery//\ /+}
      if [ "\$opParam" == '-exploit' ] || [ "\$opParam" == '-exp' ]
              then {
                query=\${query/-exp+}
                query=\${query/-exploit+}
                query=\${query/-sdn+}
                query=\${query/-shodan+}
                \$browser https://exploits.shodan.io/?q=\$query
        }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Baidu Search Filters:
                    For Images     -exploit       -exp
                 "
            exit
      }
        else {
          query=\${query/-sdn+}
          query=\${query/-shodan+}
          \$browser www.shodan.io/search?query=\$query
          exit
        }
      fi

    }

    #   Startpage Search Function

    function startpage() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-spg+}
        query=\${query/-startpage+}
        \$browser www.startpage.com/do/search?q=\$query
    }

    #   Facebook Search Function

    function facebook() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-fb+}
        query=\${query/-facebook+}
        \$browser www.facebook.com/search?q=\$query
    }

    #   Twitter Search Function

    function twitter() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ttr+}
        query=\${query/-twitter+}
        \$browser www.twitter.com/search?q=\$query
    }

    #   Reddit Search Function

    function reddit() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-rddt+}
        query=\${query/-reddit+}
        \$browser www.reddit.com/search?q=\$query
    }

    #   LinkedIn Search Function

    function linkedin() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-lnkdn+}
        query=\${query/-linkedin+}
        \$browser www.linkedin.com/search?q=\$query
    }

    #   Youtube Search Function

    function youtube() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-ytb+}
        query=\${query/-youtube+}
        \$browser www.youtube.com/results?q=\$query
    }

    #   Google+ Search Function

    function googleplus() {
        dbCheck
        query=\${tmpquery//\ /%20}
        query=\${query/-ggl+%20}
        query=\${query/-googleplus%20}
        \$browser plus.google.com/s/\$query
    }

    #   Pinterest Search Function

    function pinterest() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-pntr+}
        query=\${query/-pinterest+}
        \$browser www.pinterest.com/search?q=\$query
    }

    #   Tumblr Search Function

    function tumblr() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-tmblr+}
        query=\${query/-tumblr+}
        \$browser www.tumblr.com/search/\$query
    }

    #   Quora Search Function

    function quora() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-qra+}
        query=\${query/-quora+}
        \$browser www.quora.com/search?q=\$query
    }

    #   Wikipedia Search Function

    function wikipedia() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-wiki+}
        query=\${query/-wikipedia+}
        \$browser www.wikipedia.org/wiki/?search=\$query
    }

    #   Stack Overflow Search Function

    function stackoverflow() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-stkof+}
        query=\${query/-stackoverflow+}
        \$browser www.stackoverflow.com/search?q=\$query
    }

    #   Amazon Search Function

    function amazon() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-amzn+}
        query=\${query/-amazon+}
        \$browser www.amazon.com/s/?keywords=\$query
    }

    #   Ebay Search Function

    function ebay() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-eby+}
        query=\${query/-ebay+}
        \$browser www.ebay.com/sch/i.html?_nkw=\$query
    }

    #   Github Search Function

    function github() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${query/-gthb+}
        query=\${query/-github+}
        \$browser www.github.com/search/?q=\$query
    }

    #   Gitlab Search Fucntion

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

            Options For Seachit's Functionality

                --about     -a          For About Section
                --help      -h    -?    For Help section
                --uninstall -un         For Uninstall
                --update    -u          For Update
                --Version   -v          For Version
                --config    -cfg        For Configuration
                --release   -rn         For Release Note
                --readme    -rdm        For README

                                    Ex: \"searchit --help\"

            Search Options:

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

            Shortcuts For Instant Search
                duckit      For DuckDuckGo
                googleit    For Google

                                    Ex: \"duckit thug life\"
        "
    }

    #   Default Browser Specifier

    function browserCheck() {
        echo "Please Select Your Default Browser:"
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

    #   Default Search Engine Specifier

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
        cat ~/.searchit/searchit.cfg | grep "Default"
        echo ""
        echo "Do You Want To Change This Configuration? (Y/N):"
        read decision;
        if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
        then {
            cd ~/.searchit/
            sudo rm searchit.cfg
            browserCheck
            defaultEngine
            cat  >> searchit.cfg <<CONFIGEND
Searchit Configuration File.
Please Do Not Make Any Change To This File.
Use Command "searchit -cfg" To Make Any Changes
----------------------------------

Default Browser: \$var1
Default Search Engine: \$var2
CONFIGEND
        echo "Default Configuration Has Been Changed!"
            }
            else {
                echo "No Change Has Been Made For Default Configuration"
            }
            fi
        }

    #   Uninstaller function

    function uninstaller(){
        echo " Do You Really Want To Uninstall Seachit? (Y/N):"
        read decision;
        if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
        then {
            cd /usr/bin
            sudo rm duckit googleit searchit
            cd ~
            sudo rm -r .searchit
            uninstallCheck
        }
        else {
                echo " Good Decision :) "
        }
        fi
    }

#   Double Check Uninstall

    function uninstallCheck() {
        if [ -f /usr/bin/searchit ] && [ -f /usr/bin/googleit ] && [ -f /usr/bin/duckit ] && [ -f ~/.searchit/searchit.cfg ] && [ -f ~/.searchit/Release-Note ];
        then {
            echo "Uninstalation Failed"
            echo "Report Problem : https://github.com/xCommunicado/Searchit/issues "
        }
        else {
            echo "
            Uninstallation Complete!! :(

            Sorry To See You Go. You Can Help Me To Improve Searchit.
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
               Terminal Based Search Customizer

               Author:  xCommunicado
               Twitter: https://twitter.com/xCommunicado
               Github:  https://github.com/xCommunicado/Searchit
               License: GNU General Public License v3.0

        "
    }

    #   Update Function

    function update(){
        cd ~
        wget https://raw.githubusercontent.com/xCommunicado/Searchit/master/Version
        AvailableVersion=\$(cat Version)
        if [ "\$AvailableVersion" == "\$version" ]
        then {
            echo "You Are Up-To-Date"
        }
        else
            {
            echo "Version \$AvailableVersion Is Available. Do You Want To Update?"
            read decision;
            if [ "\$decision" == "Y" ] || [ "\$decision" == "y" ]
            then {
                sudo rm /usr/bin/searchit /usr/bin/googleit /usr/bin/duckit
                sudo rm -r ~/.searchit
                wget https://github.com/xCommunicado/Searchit/archive/master.zip
                unzip master.zip
                cd Searchit-master
                ./Searchit_Installer.sh
                rm ~/master.zip
                rm -r ~/Searchit-master
                echo "Update Complete !!"
            }
            else {
                    echo " Maybe Later -_- "
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
            echo "Please Provide A Option Or A Search Query"
            echo "Ex: \" searchit --help \" Or \" searchit john wick \""
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
            elif [ "\$parameter" == '--readme' ] || [ "\$parameter" == '-rdm' ]
                then {
                    clear
                    cat ~/.searchit/README.txt
                }
            elif [ "\$parameter" == '--release' ] || [ "\$parameter" == '-rn' ]
                then {
                    clear
                    cat ~/.searchit/Release-Note
                }
            elif [ "\$parameter" == '--version' ] || [ "\$parameter" == '-v' ]
                then {
                    echo "Searchit Version:\$version"
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

    # Calling Parameter Check Function For Initialization

    paramCheck

SEARCHITEND
}

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
                Github:     https://github.com/xCommunicado
                Twitter:    https://twitter.com/xCommunicado
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
        cat  >> duckit <<DUCKITEND
        #!/usr/bin/env bash
        tmpBrowser=\$(cat ~/.searchit/searchit.cfg | grep "Browser")
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
            echo "ERROR: Unable to read configuration file"
        }
        fi
        input="\$@"
        query=\${input//\ /+}
        \$browser www.duckduckgo.com/?q=\$query
DUCKITEND
}

#   Creating Command File For Google

function createGoogleit() {
        cat >> googleit <<GOOGLEITEND
        #!/usr/bin/env bash
        tmpBrowser=\$(cat ~/.searchit/searchit.cfg | grep "Browser")
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
            echo "ERROR: Unable to read configuration file"
        }
        fi
        input="\$@"
        query=\${input//\ /+}
        \$browser www.google.com/search?q=\$query
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
