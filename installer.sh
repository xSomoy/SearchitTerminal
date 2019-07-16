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

version=2.0a-1

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
            echo " Shodan Search Filters:
                    For Exploits     -exploit       -exp
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
      if [ "\$opParam" == '-image' ] || [ "\$opParam" == '-img' ]
              then {
                query=\${query/-img+}
                query=\${query/-image+}
                option="pics"
        }
      elif [ "\$opParam" == '-video' ] || [ "\$opParam" == '-vid' ]
              then {
                query=\${query/-vid+}
                query=\${query/-video+}
                option="video"
          }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Startpage Search Filters:
                    For Images     -image       -img
                    For Videos     -video       -vid
                 "
            exit
      }
        else {
          option=""
        }
      fi
        query=\${query/-spg+}
        query=\${query/-startpage+}
        \$browser www.startpage.com/do/search?q=\$query\&cat=\$option
    }

    #   Facebook Search Function

    function facebook() {
        dbCheck
        query=\${tmpquery//\ /+}
        query=\${tmpquery//\ /+}
      if [ "\$opParam" == '-post' ] || [ "\$opParam" == '-pst' ]
              then {
                query=\${query/-pst+}
                query=\${query/-post+}
                option="posts"
          }
      elif [ "\$opParam" == '-people' ] || [ "\$opParam" == '-ppl' ]
              then {
                query=\${query/-ppl+}
                query=\${query/-people+}
                option="people"
        }
      elif [ "\$opParam" == '-image' ] || [ "\$opParam" == '-img' ]
              then {
                query=\${query/-img+}
                query=\${query/-image+}
                option="photos"
        }
      elif [ "\$opParam" == '-video' ] || [ "\$opParam" == '-vid' ]
              then {
                query=\${query/-vid+}
                query=\${query/-video+}
                option="videos"
          }
      elif [ "\$opParam" == '-page' ] || [ "\$opParam" == '-pge' ]
                  then {
                    query=\${query/-pge+}
                    query=\${query/-page+}
                    option="pages"
          }
      elif [ "\$opParam" == '-place' ] || [ "\$opParam" == '-plc' ]
                  then {
                    query=\${query/-plc+}
                    query=\${query/-place+}
                    option="places"
          }
      elif [ "\$opParam" == '-group' ] || [ "\$opParam" == '-grp' ]
                  then {
                    query=\${query/-grp+}
                    query=\${query/-group+}
                    option="groups"
          }
      elif [ "\$opParam" == '-apps' ] || [ "\$opParam" == '-app' ]
                  then {
                    query=\${query/-app+}
                    query=\${query/-apps+}
                    option="apps"
          }
      elif [ "\$opParam" == '-event' ] || [ "\$opParam" == '-evt' ]
                  then {
                    query=\${query/-evt+}
                    query=\${query/-event+}
                    option="events"
          }
      elif [ "\$opParam" == '-link' ] || [ "\$opParam" == '-lnk' ]
                  then {
                    query=\${query/-lnk+}
                    query=\${query/-link+}
                    option="links"
          }
      elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
          then {
            echo " Facebook Search Filters:
                    For Post       -post        -pst
                    For People     -people      -ppl
                    For Images     -image       -img
                    For Videos     -video       -vid
                    For Pages      -page        -pge
                    For Places     -place       -plc
                    For Groups     -group       -grp
                    For Apps       -apps        -app
                    For Events     -event       -evt
                    For Links      -link        -lnk
                 "
            exit
      }
        else {
          option="top"
        }
      fi
        query=\${query/-fb+}
        query=\${query/-facebook+}
        \$browser www.facebook.com/search/\$option/?q=\$query
    }

    #   Twitter Search Function

    function twitter() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-latest' ] || [ "\$opParam" == '-lst' ]
                then {
                  query=\${query/-lst+}
                  query=\${query/-latest+}
                  option="&f=tweets"
            }
        elif [ "\$opParam" == '-people' ] || [ "\$opParam" == '-ppl' ]
                then {
                  query=\${query/-ppl+}
                  query=\${query/-people+}
                  option="&f=users"
          }
        elif [ "\$opParam" == '-image' ] || [ "\$opParam" == '-img' ]
                then {
                  query=\${query/-img+}
                  query=\${query/-image+}
                  option="&f=images"
          }
        elif [ "\$opParam" == '-video' ] || [ "\$opParam" == '-vid' ]
                then {
                  query=\${query/-vid+}
                  query=\${query/-video+}
                  option="&f=videos"
            }
        elif [ "\$opParam" == '-news' ] || [ "\$opParam" == '-nws' ]
                    then {
                      query=\${query/-nws+}
                      query=\${query/-news+}
                      option="&f=news"
            }
        elif [ "\$opParam" == '-broadcast' ] || [ "\$opParam" == '-brd' ]
                    then {
                      query=\${query/-brd+}
                      query=\${query/-broadcast+}
                      option="&f=broadcasts"
            }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo " Twitter Search Filters:
                        For Latest     -latest      -lst
                        For People     -people      -ppl
                        For Images     -image       -img
                        For Videos     -video       -vid
                        For News       -news        -nws
                        For Broadcast  -broadcast   -brd
                     "
                exit
          }
            else {
              option=""
            }
          fi
        query=\${query/-ttr+}
        query=\${query/-twitter+}
        \$browser www.twitter.com/search?q=\$query\$option
    }

    #   Reddit Search Function

    function reddit() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-post' ] || [ "\$opParam" == '-pst' ]
                then {
                  query=\${query/-pst+}
                  query=\${query/-post+}
                  option="link"
            }
        elif [ "\$opParam" == '-user' ] || [ "\$opParam" == '-usr' ]
                then {
                  query=\${query/-usr+}
                  query=\${query/-user+}
                  option="sr%2Cuser"
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo " Reddit Search Filters:
                        For Posts                  -post      -pst
                        For Communities and users  -user      -usr
                     "
                exit
          }
        else {
              option=""
            }
        fi
        query=\${query/-rddt+}
        query=\${query/-reddit+}
        \$browser www.reddit.com/search?q=\$query\&type=\$option
    }

    #   LinkedIn Search Function

    function linkedin() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-people' ] || [ "\$opParam" == '-ppl' ]
                then {
                  query=\${query/-ppl+}
                  query=\${query/-people+}
                  option="people"
            }
        elif [ "\$opParam" == '-jobs' ] || [ "\$opParam" == '-job' ]
                then {
                  query=\${query/-job+}
                  query=\${query/-jobs+}
                  query=\${query/-lnkdn+}
                  query=\${query/-linkedin+}
                  \$browser www.linkedin.com/jobs/search/?keywords=\$query
                  exit
          }
        elif [ "\$opParam" == '-content' ] || [ "\$opParam" == '-cnt' ]
                then {
                  query=\${query/-cnt+}
                  query=\${query/-content+}
                  option="content"
          }
        elif [ "\$opParam" == '-company' ] || [ "\$opParam" == '-cpy' ]
                then {
                  query=\${query/-cpy+}
                  query=\${query/-company+}
                  option="companies"
          }
        elif [ "\$opParam" == '-school' ] || [ "\$opParam" == '-scl' ]
                then {
                  query=\${query/-scl+}
                  query=\${query/-school+}
                  option="schools"
          }
        elif [ "\$opParam" == '-group' ] || [ "\$opParam" == '-grp' ]
                then {
                  query=\${query/-grp+}
                  query=\${query/-group+}
                  option="groups"
          }
        elif [ "\$opParam" == '-firstname' ] || [ "\$opParam" == '-fnm' ]
                then {
                  query=\${query/-fnm+}
                  query=\${query/-firstname+}
                  query=\${query/-lnkdn+}
                  query=\${query/-linkedin+}
                  \$browser www.linkedin.com/people/search?firstName=\$query
                  exit
          }
        elif [ "\$opParam" == '-lastname' ] || [ "\$opParam" == '-lnm' ]
                then {
                  query=\${query/-lnm+}
                  query=\${query/-lastname+}
                  query=\${query/-lnkdn+}
                  query=\${query/-linkedin+}
                  \$browser www.linkedin.com/people/search?lastName=\$query
                  exit
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  LinkedIn Search Filters:
                        For People        -people    -ppl
                        For Jobs          -jobs      -job
                        For Content       -content   -cnt
                        For Companies     -company   -cpy
                        For Schools       -school    -scl
                        For Groups        -group     -grp
                        For First Name    -firstname -fnm
                        For Last Name     -lastname  -lnm

                     "
                exit
          }
        else {
              option="search/results/all"
            }
        fi
        query=\${query/-lnkdn+}
        query=\${query/-linkedin+}
        \$browser www.linkedin.com/search/results/\$option/?keywords=\$query
    }

    #   Youtube Search Function

    function youtube() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-video' ] || [ "\$opParam" == '-vid' ]
                then {
                  query=\${query/-vid+}
                  query=\${query/-video+}
                  option="EgIQAQ%253D%253D"
            }
        elif [ "\$opParam" == '-channel' ] || [ "\$opParam" == '-cnl' ]
                then {
                  query=\${query/-cnl+}
                  query=\${query/-channel+}
                  option="EgIQAg%253D%253D"
          }
        elif [ "\$opParam" == '-playlist' ] || [ "\$opParam" == '-plt' ]
                then {
                  query=\${query/-plt+}
                  query=\${query/-playlist+}
                  option="EgIQAw%253D%253D"
          }
        elif [ "\$opParam" == '-movie' ] || [ "\$opParam" == '-mve' ]
                then {
                  query=\${query/-mve+}
                  query=\${query/-movie+}
                  option="EgIQBA%253D%253D"
          }
        elif [ "\$opParam" == '-show' ] || [ "\$opParam" == '-shw' ]
                then {
                  query=\${query/-shw+}
                  query=\${query/-show+}
                  option="EgIQBQ%253D%253D"
          }
        elif [ "\$opParam" == '-short' ] || [ "\$opParam" == '-srt' ]
                then {
                  query=\${query/-srt+}
                  query=\${query/-short+}
                  option="EgIYAQ%253D%253D"
          }
        elif [ "\$opParam" == '-long' ] || [ "\$opParam" == '-lng' ]
                then {
                  query=\${query/-lng+}
                  query=\${query/-long+}
                  option="EgIYAg%253D%253D"
          }
        elif [ "\$opParam" == '-hour' ] || [ "\$opParam" == '-hur' ]
                then {
                  query=\${query/-hur+}
                  query=\${query/-hour+}
                  option="EgQIARAB"
          }
        elif [ "\$opParam" == '-today' ] || [ "\$opParam" == '-tdy' ]
                then {
                  query=\${query/-tdy+}
                  query=\${query/-today+}
                  option="EgQIAhAB"
          }
        elif [ "\$opParam" == '-week' ] || [ "\$opParam" == '-wek' ]
                then {
                  query=\${query/-wek+}
                  query=\${query/-week+}
                  option="EgQIAxAB"
          }
        elif [ "\$opParam" == '-month' ] || [ "\$opParam" == '-mth' ]
                then {
                  query=\${query/-mth+}
                  query=\${query/-month+}
                  option="EgQIBBAB"
          }
        elif [ "\$opParam" == '-year' ] || [ "\$opParam" == '-yar' ]
                then {
                  query=\${query/-yar+}
                  query=\${query/-year+}
                  option="EgQIBRAB"
          }
        elif [ "\$opParam" == '-live' ] || [ "\$opParam" == '-lve' ]
                then {
                  query=\${query/-lve+}
                  query=\${query/-live+}
                  option="EgQQAUAB"
          }
        elif [ "\$opParam" == '-4k' ]
                then {
                  query=\${query/-4k+}
                  option="EgQQAXAB"
          }
        elif [ "\$opParam" == '-hd' ]
                then {
                  query=\${query/-hd+}
                  option="EgQQASAB"
          }
        elif [ "\$opParam" == '-caption' ] || [ "\$opParam" == '-cc' ]
                then {
                  query=\${query/-cc+}
                  query=\${query/-caption+}
                  option="EgQQASgB"
          }
        elif [ "\$opParam" == '-common' ] || [ "\$opParam" == '-cmn' ]
                then {
                  query=\${query/-cmn+}
                  query=\${query/-common+}
                  option="EgQQATAB"
          }
        elif [ "\$opParam" == '-360' ]
                then {
                  query=\${query/-360+}
                  option="EgQQAXgB"
          }
        elif [ "\$opParam" == '-hdr' ]
                then {
                  query=\${query/-hdr+}
                  option="EgPIAQE%253D"
          }
        elif [ "\$opParam" == '-location' ] || [ "\$opParam" == '-lcn' ]
                then {
                  query=\${query/-lcn+}
                  query=\${query/-location+}
                  option="EgO4AQE%253D"
          }
        elif [ "\$opParam" == '-purchase' ] || [ "\$opParam" == '-prc' ]
                then {
                  query=\${query/-prc+}
                  query=\${query/-purchase+}
                  option="EgJIAQ%253D%253D"
          }
        elif [ "\$opParam" == '-date' ] || [ "\$opParam" == '-dte' ]
                then {
                  query=\${query/-dte+}
                  query=\${query/-date+}
                  option="CAI%253D"
          }
        elif [ "\$opParam" == '-views' ] || [ "\$opParam" == '-vws' ]
                then {
                  query=\${query/-vws+}
                  query=\${query/-views+}
                  option="CAMSAhAB"
          }
        elif [ "\$opParam" == '-rate' ] || [ "\$opParam" == '-rte' ]
                then {
                  query=\${query/-rate+}
                  query=\${query/-rte+}
                  option="CAESAhAB"
          }
        elif [ "\$opParam" == '-vr180' ] || [ "\$opParam" == '-180' ]
                then {
                  query=\${query/-180+}
                  query=\${query/-vr180+}
                  option="EgPQAQE%253D"
          }
        elif [ "\$opParam" == '-3d' ]
                then {
                  query=\${query/-3d+}
                  option="EgQQATgB"
          }

        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Youtube Search Filters:
                        For Videos            -video     -vid
                        For Channel           -Channel   -cnl
                        For Playlist          -playlist  -plt
                        For Movie             -movie     -mve
                        For Show              -show      -shw
                        For Short Videos      -short     -srt
                        For Long Videos       -long      -lng
                        For Last Hour         -hour      -hur
                        For Today             -today     -tdy
                        For Week              -week      -wek
                        For Month             -month     -mth
                        For Year              -year      -yar
                        For Live              -live      -lve
                        For 4k                -4k
                        For HD                -hd
                        For Caption/CC        -caption   -cc
                        For Creative Commons  -common    -cmn
                        For 360               -360
                        For VR180             -vr180     -180
                        For 3D                -3d
                        For HDR               -hdr
                        For Location          -location  -lcn
                        For Purchase          -purchase  -prc
                        For Short By Date     -date      -dte
                        For Short By Views    -views     -vws
                        For Short By Rating   -rate      -rte
                     "
                exit
          }
        else {
              option=""
            }
        fi

        query=\${query/-ytb+}
        query=\${query/-youtube+}
        \$browser www.youtube.com/results?search_query=\$query\&sp=\$option
    }

    #   Pinterest Search Function

    function pinterest() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-mypin' ] || [ "\$opParam" == '-my' ]
                then {
                  query=\${query/-my+}
                  query=\${query/-mypin+}
                  option="mypins"
            }
        elif [ "\$opParam" == '-pdt' ] || [ "\$opParam" == '-product' ]
                then {
                  query=\${query/-pdt+}
                  query=\${query/-product+}
                  option="buyable_pins"
          }
        elif [ "\$opParam" == '-people' ] || [ "\$opParam" == '-ppl' ]
                then {
                  query=\${query/-ppl+}
                  query=\${query/-people+}
                  option="users"
          }
        elif [ "\$opParam" == '-board' ] || [ "\$opParam" == '-brd' ]
                then {
                  query=\${query/-brd+}
                  query=\${query/-board+}
                  option="boards"
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Pinterest Search Filters:
                        For Your Pins           -mypin       -my
                        For Product Pins        -product     -pdt
                        For People              -people      -ppl
                        For Boards              -board       -brd
                     "
                exit
          }
        else {
              option="pins"
            }
        fi
        query=\${query/-pntr+}
        query=\${query/-pinterest+}
        \$browser www.pinterest.com/search/\$option/?q=\$query
    }

    #   Tumblr Search Function

    function tumblr() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "NOTE: Tumblr doesn't have any search filters."
                exit
          }
        else {
          query=\${query/-tmblr+}
          query=\${query/-tumblr+}
          \$browser www.tumblr.com/search/\$query
            }
        fi
    }

    #   Quora Search Function

    function quora() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-question' ] || [ "\$opParam" == '-qsn' ]
                then {
                  query=\${query/-qsn+}
                  query=\${query/-question+}
                  option="question"
            }
        elif [ "\$opParam" == '-answer' ] || [ "\$opParam" == '-ans' ]
                then {
                  query=\${query/-ans+}
                  query=\${query/-answer+}
                  option="answer"
          }
        elif [ "\$opParam" == '-post' ] || [ "\$opParam" == '-pst' ]
                then {
                  query=\${query/-pst+}
                  query=\${query/-post+}
                  option="post"
          }
        elif [ "\$opParam" == '-profile' ] || [ "\$opParam" == '-pfl' ]
                then {
                  query=\${query/-pfl+}
                  query=\${query/-profile+}
                  option="profile"
          }
        elif [ "\$opParam" == '-topic' ] || [ "\$opParam" == '-tpc' ]
                then {
                  query=\${query/-tpc+}
                  query=\${query/-topic+}
                  option="topic"
          }
        elif [ "\$opParam" == '-blog' ] || [ "\$opParam" == '-blg' ]
                then {
                  query=\${query/-blg+}
                  query=\${query/-blog+}
                  option="blog"
          }
        elif [ "\$opParam" == '-space' ] || [ "\$opParam" == '-spc' ]
                then {
                  query=\${query/-spc+}
                  query=\${query/-space+}
                  option="tribe"
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Quora Search Filters:
                        For Question          -question      -qsn
                        For Answer            -answer        -ans
                        For Posts             -post          -pst
                        For Profile           -profile       -pfl
                        For Topic             -topic         -tpc
                        For Blogs             -blog          -blg
                        For Spaces            -space         -spc
                     "
                exit
          }
        else {
              option=""
            }
        fi
        query=\${query/-qra+}
        query=\${query/-quora+}
        \$browser www.quora.com/search?q=\$query\&type=\$option
    }

    #   Wikipedia Search Function

    function wikipedia() {
        dbCheck
        query=\${tmpquery//\ /+}
      if [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
            then {
              echo "NOTE: Wikipedia doesn't have any search filters."
              exit
        }
      else {
        query=\${query/-wiki+}
        query=\${query/-wikipedia+}
        \$browser www.wikipedia.org/wiki/?search=\$query
          }
      fi
    }

    #   Stack Overflow Search Function

    function stackoverflow() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-newest' ] || [ "\$opParam" == '-new' ]
                then {
                  query=\${query/-new+}
                  query=\${query/-newest+}
                  option="newest"
            }
        elif [ "\$opParam" == '-active' ] || [ "\$opParam" == '-act' ]
                then {
                  query=\${query/-act+}
                  query=\${query/-active+}
                  option="active"
          }
        elif [ "\$opParam" == '-vote' ] || [ "\$opParam" == '-vot' ]
                then {
                  query=\${query/-vot+}
                  query=\${query/-vote+}
                  option="votes"
          }
        elif [ "\$opParam" == '-jobs' ] || [ "\$opParam" == '-job' ]
                then {
                  query=\${query/-job+}
                  query=\${query/-jobs+}
                  query=\${query/-stkof+}
                  query=\${query/-stackoverflow+}
                  \$browser www.stackoverflow.com/jobs?q=\$query
                  exit
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  StackOverflow Search Filters:
                        For Newst          -newest     -new
                        For Active         -active     -act
                        For Votes          -votes      -vot
                        For Jobs           -jobs       -job
                     "
                exit
          }
        else {
              option="releveace"
            }
        fi
        query=\${query/-stkof+}
        query=\${query/-stackoverflow+}
        \$browser www.stackoverflow.com/search?q=\$query\&tab=\$option
    }

    #   Amazon Search Function

    function amazon() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-art' ] || [ "\$opParam" == '-craft' ]
                then {
                  query=\${query/-art+}
                  query=\${query/-craft+}
                  option="arts-crafts-intl-ship"
            }
        elif [ "\$opParam" == '-automotive' ] || [ "\$opParam" == '-auto' ]
                then {
                  query=\${query/-auto+}
                  query=\${query/-automotive+}
                  option="automotive-intl-ship"
          }
        elif [ "\$opParam" == '-baby' ] || [ "\$opParam" == '-bby' ]
                then {
                  query=\${query/-bby+}
                  query=\${query/-baby+}
                  option="baby-products-intl-ship"
          }
        elif [ "\$opParam" == '-beauty' ] || [ "\$opParam" == '-bty' ] || [ "\$opParam" == '-personal' ]
                then {
                  query=\${query/-bty+}
                  query=\${query/-beauty+}
                  query=\${query/-personal+}
                  option="beauty-intl-ship"
          }
        elif [ "\$opParam" == '-book' ] || [ "\$opParam" == '-bks' ]
                then {
                  query=\${query/-bks+}
                  query=\${query/-book+}
                  option="stripbooks-intl-ship"
          }
        elif [ "\$opParam" == '-computer' ] || [ "\$opParam" == '-com' ]
                then {
                  query=\${query/-com+}
                  query=\${query/-computer+}
                  option="computers-intl-ship"
          }
        elif [ "\$opParam" == '-digitalmusic' ] || [ "\$opParam" == '-dmc' ]
                then {
                  query=\${query/-dmc+}
                  query=\${query/-digitalmusic+}
                  option="digital-music"
          }
        elif [ "\$opParam" == '-electronics' ] || [ "\$opParam" == '-elc' ]
                then {
                  query=\${query/-elc+}
                  query=\${query/-electronics+}
                  option="electronics-intl-ship"
          }
        elif [ "\$opParam" == '-kindle' ] || [ "\$opParam" == '-kdl' ]
                then {
                  query=\${query/-kdl+}
                  query=\${query/-kindle+}
                  option="digital-text"
          }
        elif [ "\$opParam" == '-primevideo' ] || [ "\$opParam" == '-pvd' ]
                then {
                  query=\${query/-pvd+}
                  query=\${query/-primevideo+}
                  option="instant-video"
          }
        elif [ "\$opParam" == '-women' ] || [ "\$opParam" == '-wmn' ]
                then {
                  query=\${query/-wmn+}
                  query=\${query/-women+}
                  option="fashion-womens-intl-ship"
          }
        elif [ "\$opParam" == '-men' ] || [ "\$opParam" == '-man' ]
                then {
                  query=\${query/-man+}
                  query=\${query/-men+}
                  option="fashion-mens-intl-ship"
          }
        elif [ "\$opParam" == '-girl' ] || [ "\$opParam" == '-grl' ]
                then {
                  query=\${query/-grl+}
                  query=\${query/-girl+}
                  option="fashion-girls-intl-ship"
          }
        elif [ "\$opParam" == '-boys' ] || [ "\$opParam" == '-boy' ]
                then {
                  query=\${query/-boy+}
                  query=\${query/-boys+}
                  option="fashion-boys-intl-ship"
          }
        elif [ "\$opParam" == '-deal' ] || [ "\$opParam" == '-dls' ]
                then {
                  query=\${query/-dls+}
                  query=\${query/-deal+}
                  option="deals-intl-ship"
          }
        elif [ "\$opParam" == '-health' ] || [ "\$opParam" == '-hlt' ] || [ "\$opParam" == '-houshold' ]
                then {
                  query=\${query/-health+}
                  query=\${query/-hlt+}
                  query=\${query/-houshold+}
                  option="hpc-intl-ship"
          }
        elif [ "\$opParam" == '-home' ] || [ "\$opParam" == '-hme' ] || [ "\$opParam" == '-kitchen' ]
                then {
                  query=\${query/-hme+}
                  query=\${query/-home+}
                  query=\${query/-kitchen+}
                  option="kitchen-intl-ship"
          }
        elif [ "\$opParam" == '-industrial' ] || [ "\$opParam" == '-ids' ]  || [ "\$opParam" == '-science' ]  || [ "\$opParam" == '-sci' ]
                then {
                  query=\${query/-industrial+}
                  query=\${query/-ids+}
                  query=\${query/-science+}
                  query=\${query/-sci+}
                  option="industrial-intl-ship"
          }
        elif [ "\$opParam" == '-luggage' ] || [ "\$opParam" == '-lge' ]
                then {
                  query=\${query/-lge+}
                  query=\${query/-luggage+}
                  option="luggage-intl-ship"
          }
        elif [ "\$opParam" == '-movie' ] || [ "\$opParam" == '-mvi' ] || [ "\$opParam" == '-tv' ]
                then {
                  query=\${query/-movie+}
                  query=\${query/-mvi+}
                  query=\${query/-tv+}
                  option="movies-tv-intl-ship"
          }
        elif [ "\$opParam" == '-music' ] || [ "\$opParam" == '-msc' ]
                then {
                  query=\${query/-msc+}
                  query=\${query/-music+}
                  option="music-intl-ship"
          }
        elif [ "\$opParam" == '-petsupply' ] || [ "\$opParam" == '-pet' ]
                then {
                  query=\${query/-pet+}
                  query=\${query/-petsupply+}
                  option="pets-intl-ship"
          }
        elif [ "\$opParam" == '-software' ] || [ "\$opParam" == '-sft' ]
                then {
                  query=\${query/-sft+}
                  query=\${query/-software+}
                  option="software-intl-ship"
          }
        elif [ "\$opParam" == '-sport' ] || [ "\$opParam" == '-spt' ]
                then {
                  query=\${query/-spt+}
                  query=\${query/-sport+}
                  option="sporting-intl-ship"
          }
        elif [ "\$opParam" == '-tool' ] || [ "\$opParam" == '-tls' ]
                then {
                  query=\${query/-tls+}
                  query=\${query/-tool+}
                  option="tools-intl-shi"
          }
        elif [ "\$opParam" == '-toy' ] || [ "\$opParam" == '-toys' ]
                then {
                  query=\${query/-toy+}
                  query=\${query/-toys+}
                  option="toys-and-games-intl-shi"
          }
        elif [ "\$opParam" == '-game' ] || [ "\$opParam" == '-gme' ]
                then {
                  query=\${query/-gme+}
                  query=\${query/-game+}
                  option="videogames-intl-ship"
          }

        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Amazon Search Filters:
                        For Arts & Crafts             -craft        -art
                        For Automotive                -automotive   -auto
                        For Baby                      -baby         -bby
                        For Beauty And Personal Care  -beauty       -bty     -personal
                        For Books                     -book         -bks
                        For Computers                 -computer     -com
                        For Digital Music             -digitalmusic -dmc
                        For Electronics               -electronics  -elc
                        For Kindle Store              -kindle       -kdl
                        For Prime Video               -primevideo   -pvd
                        For Women's Fashion           -women        -wmn
                        For Men's Fashion             -men          -man
                        For Girl's Fashion            -girl         -grl
                        For Boy's Fashion             -boys         -boy
                        For Deals                     -deal         -dls
                        For Health & Houshold         -health       -hlt     -houshold
                        For Home & Kitchen            -home         -hme     -kitchen
                        For Industrial & Scientific   -industrial   -ids     -science     -sci
                        For Luggage                   -luggage      -lge
                        For Movies & Tv               -movie        -mvi    -tv
                        For Music,CD,Vinyl            -music        -msc
                        For Pet Supplies              -petsupply    -pet
                        For Software                  -software     -sft
                        For Sports                    -sport        -spt
                        For Tools & Home Improvemnt   -tool         -tls
                        For Toys & Games              -toys         -toy
                        For Video Games               -game         -gme
                     "
                exit
          }
        else {
              option=""
            }
        fi
        query=\${query/-amzn+}
        query=\${query/-amazon+}
        \$browser www.amazon.com/s/?k=\$query\&i=\$option
    }

    #   Ebay Search Function

    function ebay() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-' ] || [ "\$opParam" == '-' ]
                then {
                  query=\${query/-+}
                  query=\${query/-+}
                  option=""
            }
        elif [ "\$opParam" == '-' ] || [ "\$opParam" == '-' ]
                then {
                  query=\${query/-+}
                  query=\${query/-+}
                  option=""
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Ebay Search Filters:
                        For Antique                           -antique        -atq
                        For Art                               -art
                        For Baby                              -baby           -bby
                        For Book                              -book           -bks
                        For Business & Industrial             -business       -industrial      -bsn     -ids
                        For Camera & Photo                    -camera         -cmr             -photo   -pht
                        For Cell Phone & Accessories          -phone          -phn
                        For Clothes, Shoes & Accessories      -clothe         -shoe            -clt     -sho
                        For Coin & Paper Money                -coin           -money           -cin     -mny
                        For Collectibles                      -collectibles   -clt
                        For Computers                         -computer       -com
                        For Consumer Electronics              -electronic     -elc
                        For Crafts                            -craft          -cft
                        For Dolls & Bears                     -doll           -dll             -bear    -ber
                        For DVD's & Movies                    -movie          -mve             -dvd
                        For eBay Motors                       -motor          -mtr
                        For Entertainment                     -entertainment  -ent
                        For Everything Else                   -everything     -evr
                        For Gift Cards & Coupo                -coupon         -cpn
                        For Health & Beauty                   -health         -beauty           -hlt     -bty
                        For Home & Garden                     -home           -garden           -hme     -grd
                        For Jewelry & Watches                 -Jewelry        -jwl
                        For Music                             -music          -msc
                        For Musical Instrument                -instrument     -ins
                        For Pet Supplies                      -petsupply      -pet
                        For Pottery & Glass                   -pottery        -pot
                        For Real States                       -realstate      -rst
                        For Specialty Service                 -service        -svc
                        For Sporting Good                     -sportinggood   -sgd
                        For Sports                            -sport          -spt
                        For Stamps                            -stamp          -stm
                        For Tickets & Experience              -ticket         -tkt
                        For Toys And Hobbies                  -toy            -hobby            -hby
                        For Travel                            -travel         -tvl
                        For Video Games                       -game           -gme
                   "
                exit
          }
        else {
              option=""
            }
        fi
        query=\${query/-eby+}
        query=\${query/-ebay+}
        \$browser www.ebay.com/sch/i.html?_nkw=\$query
    }

    #   Github Search Function

    function github() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-repository' ] || [ "\$opParam" == '-rep' ]
                then {
                  query=\${query/-rep+}
                  query=\${query/-repository+}
                  option="Repositories"
            }
        elif [ "\$opParam" == '-code' ] || [ "\$opParam" == '-cde' ]
                then {
                  query=\${query/-cde+}
                  query=\${query/-code+}
                  option="Code"
          }
        elif [ "\$opParam" == '-commit' ] || [ "\$opParam" == '-cmt' ]
                then {
                  query=\${query/-cmt+}
                  query=\${query/-commit+}
                  option="Commits"
          }
        elif [ "\$opParam" == '-issue' ] || [ "\$opParam" == '-isu' ]
                then {
                  query=\${query/-isu+}
                  query=\${query/-issue+}
                  option="Issues"
          }
        elif [ "\$opParam" == '-package' ] || [ "\$opParam" == '-pac' ]
                then {
                  query=\${query/-pac+}
                  query=\${query/-package+}
                  option="RegistryPackage"
          }
        elif [ "\$opParam" == '-market' ] || [ "\$opParam" == '-mkt' ]
                then {
                  query=\${query/-mkt+}
                  query=\${query/-market+}
                  option="Marketplace"
          }
        elif [ "\$opParam" == '-topic' ] || [ "\$opParam" == '-tpc' ]
                then {
                  query=\${query/-tpc+}
                  query=\${query/-topic+}
                  option="Topics"
          }
        elif [ "\$opParam" == '-wiki' ] || [ "\$opParam" == '-wki' ]
                then {
                  query=\${query/-wki+}
                  query=\${query/-wiki+}
                  option="Wikis"
          }
        elif [ "\$opParam" == '-user' ] || [ "\$opParam" == '-usr' ]
                then {
                  query=\${query/-usr+}
                  query=\${query/-user+}
                  option="Users"
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Github Search Filters:
                        For Repositories        -repository      -rep
                        For Code                -code            -cde
                        For Commits             -commit          -cmt
                        For Issues              -issue           -isu
                        For Packages            -package         -pac
                        For Marketplace         -market          -mkt
                        For Topics              -topic           -tpc
                        For Wikis               -wiki            -wki
                        For Users               -user            -usr
                     "
                exit
          }
        else {
              option=""
            }
        fi
        query=\${query/-gthb+}
        query=\${query/-github+}
        \$browser www.github.com/search/?q=\$query\&type=\$option
    }

    #   Gitlab Search Fucntion

    function gitlab() {
        dbCheck
        query=\${tmpquery//\ /+}
        if [ "\$opParam" == '-issue' ] || [ "\$opParam" == '-isu' ]
                then {
                  query=\${query/-isu+}
                  query=\${query/-issue+}
                  option="issues"
            }
        elif [ "\$opParam" == '-merge' ] || [ "\$opParam" == '-mrg' ]
                then {
                  query=\${query/-mrg+}
                  query=\${query/-merge+}
                  option="merge_request"
          }
        elif [ "\$opParam" == '-milestone' ] || [ "\$opParam" == '-stn' ]
                then {
                  query=\${query/-stn+}
                  query=\${query/-milestone+}
                  option="milestones"
          }
        elif [ "\$opParam" == '-user' ] || [ "\$opParam" == '-usr' ]
                then {
                  query=\${query/-usr+}
                  query=\${query/-user+}
                  option="users"
          }
        elif [ "\$opParam" == '-help' ] || [ "\$opParam" == '-h' ] || [ "\$opParam" == '-?' ]
              then {
                echo "  Gitlab Search Filters:
                        For Issues          -issue      -isu
                        For Merge Request   -merge      -mrg
                        For Milestones      -milestone  -stn
                        For Users           -user       -usr
                     "
                exit
          }
        else {
              option="projects"
            }
        fi
        query=\${query/-gtlb+}
        query=\${query/-gitlab+}
        \$browser www.gitlab.com/search?search=\$query\&scope=\$option
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
        opParam="\$1"
        tmpQuery="\$@"
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
        query=\${tmpQuery//\ /+}
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
DUCKITEND
}

#   Creating Command File For Google

function createGoogleit() {
        cat >> googleit <<GOOGLEITEND
        #!/usr/bin/env bash
        opParam="\$1"
        tmpQuery="\$@"
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
        query=\${tmpQuery//\ /+}
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
