# Twitter Search Function

function twitter() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-latest' ] || [ "$opParam" == '-lst' ]
            then {
              query=${query/-lst+}
              query=${query/-latest+}
              option="&f=tweets"
        }
    elif [ "$opParam" == '-people' ] || [ "$opParam" == '-ppl' ]
            then {
              query=${query/-ppl+}
              query=${query/-people+}
              option="&f=users"
      }
    elif [ "$opParam" == '-image' ] || [ "$opParam" == '-img' ]
            then {
              query=${query/-img+}
              query=${query/-image+}
              option="&f=images"
      }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
            then {
              query=${query/-vid+}
              query=${query/-video+}
              option="&f=videos"
        }
    elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
                then {
                  query=${query/-nws+}
                  query=${query/-news+}
                  option="&f=news"
        }
    elif [ "$opParam" == '-broadcast' ] || [ "$opParam" == '-brd' ]
                then {
                  query=${query/-brd+}
                  query=${query/-broadcast+}
                  option="&f=broadcasts"
        }
    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo " ${aqua}${bold}Twitter Search Filters: ${normal}
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
    query=${query/-ttr+}
    query=${query/-twitter+}
    $browser www.twitter.com/search?q=$query$option
}
