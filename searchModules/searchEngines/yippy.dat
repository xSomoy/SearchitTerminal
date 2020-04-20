# Yippy Search Function

function yippy() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-image' ]  || [ "$opParam" == '-img' ]
        then {
          query=${query/-img+}
          query=${query/-image+}
          option="ysa/cgi-bin/query-meta?v%3aproject=yippy-com-images&v%3asources=yippy-images&query="
        }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
        then {
          query=${query/-vid+}
          query=${query/-video+}
          option="ysa/cgi-bin/query-meta?v%3aproject=yippy-com-images&v%3asources=yippy-video&query="
    }
    elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
        then {
          query=${query/-nws+}
          query=${query/-news+}
          option="ysa/cgi-bin/query-meta?v%3aproject=yippy-com&v%3asources=news-bundle&query="
    }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Yippy Search Filters: ${normal}
                For Images     -image       -img
                For Videos     -video       -vid
                For News       -news        -nws
        "
        exit
  }
    else {
          option="search?query="
    }
  fi
    query=${query/-ypy+}
    query=${query/-yippy+}
    $browser www.yippy.com/$option$query
}
