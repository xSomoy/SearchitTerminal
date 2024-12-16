# Yandex Search Function

function yandex() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-image' ]  || [ "$opParam" == '-img' ]
        then {
          query=${query/-img+}
          query=${query/-image+}
          option="images/search?text="
        }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
        then {
          query=${query/-vid+}
          query=${query/-video+}
          option="video/search?text="
    }
    elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
        then {
          query=${query/-nws+}
          query=${query/-news+}
          query=${query/-ydx+}
          query=${query/-yandex+}
          $browser news.yandex.com/yandsearch?rpt=news&text=$query
          exit

    }
  elif [ "$opParam" == '-maps' ] || [ "$opParam" == '-map' ]
          then {
            query=${query/-map+}
            query=${query/-maps+}
            option="maps/?text="
    }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Yandex Search Filters: ${normal}
                For Images     -image       -img
                For Videos     -video       -vid
                For News       -news        -nws
                For Maps       -maps        -map
        "
        exit
  }
    else {
          option="search/?text="
    }
  fi
    query=${query/-ydx+}
    query=${query/-yandex+}
    $browser yandex.com/$option$query
}
