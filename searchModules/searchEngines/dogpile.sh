# Dogpile Search Function

function dogpile() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-image' ]  || [ "$opParam" == '-img' ]
        then {
          query=${query/-img+}
          query=${query/-image+}
          option="serp?qc=images&q="
        }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
        then {
          query=${query/-vid+}
          query=${query/-video+}
          option="serp?qc=video&q="
    }
    elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
        then {
          query=${query/-nws+}
          query=${query/-news+}
          option="serp?qc=news&q="
    }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Dogpile Search Filters: ${normal}
                For Images     -image       -img
                For Videos     -video       -vid
                For News       -news        -nws
        "
        exit
  }
    else {
          option="serp?q="
    }
  fi
    query=${query/-dpl+}
    query=${query/-dogpile+}
    $browser www.dogpile.com/$option$query
}
