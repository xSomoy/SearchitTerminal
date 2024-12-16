# Startpage Search Function

function startpage() {
    dbCheck
    query=${tmpquery//\ /+}
  if [ "$opParam" == '-image' ] || [ "$opParam" == '-img' ]
          then {
            query=${query/-img+}
            query=${query/-image+}
            option="pics"
    }
  elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
          then {
            query=${query/-vid+}
            query=${query/-video+}
            option="video"
      }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Startpage Search Filters: ${normal}
                For Images     -image       -img
                For Videos     -video       -vid
             "
        exit
  }
    else {
      option=""
    }
  fi
    query=${query/-spg+}
    query=${query/-startpage+}
    $browser www.startpage.com/do/search?q=$query\&cat=$option
}
