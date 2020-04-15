# Searx Search Function

function searx() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-image' ]  || [ "$opParam" == '-img' ]
        then {
          query=${query/-img+}
          query=${query/-image+}
          option="images"
        }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
        then {
          query=${query/-vid+}
          query=${query/-video+}
          option="videos"
    }
  elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
        then {
          query=${query/-nws+}
          query=${query/-news+}
          option="news"
    }
  elif [ "$opParam" == '-files' ] || [ "$opParam" == '-fls' ]
        then {
          query=${query/-fls+}
          query=${query/-files+}
          option="files"
    }
  elif [ "$opParam" == '-it' ]
        then {
          query=${query/-it+}
          option="it"
    }
  elif [ "$opParam" == '-maps' ] || [ "$opParam" == '-map' ]
          then {
            query=${query/-map+}
            query=${query/-maps+}
            option="map"
    }
  elif [ "$opParam" == '-music' ] || [ "$opParam" == '-msc' ]
          then {
            query=${query/-msc+}
            query=${query/-music+}
            option="music"
    }
  elif [ "$opParam" == '-science' ] || [ "$opParam" == '-sci' ]
          then {
            query=${query/-sci+}
            query=${query/-science+}
            option="science"
    }
  elif [ "$opParam" == '-social' ] || [ "$opParam" == '-scl' ]
          then {
            query=${query/-scl+}
            query=${query/-social+}
            option="social+media"
    }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " S${aqua}${bold}Searx Search Filters: ${normal}
                For Images        -image       -img
                For Videos        -video       -vid
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
    query=${query/-srx+}
    query=${query/-searx+}
    $browser searx.me/?q=$query\&categories=$option
}
