# Facebook Search Function

function facebook() {
    dbCheck
    query=${tmpquery//\ /+}
    query=${tmpquery//\ /+}
  if [ "$opParam" == '-post' ] || [ "$opParam" == '-pst' ]
          then {
            query=${query/-pst+}
            query=${query/-post+}
            option="posts"
      }
  elif [ "$opParam" == '-people' ] || [ "$opParam" == '-ppl' ]
          then {
            query=${query/-ppl+}
            query=${query/-people+}
            option="people"
    }
  elif [ "$opParam" == '-image' ] || [ "$opParam" == '-img' ]
          then {
            query=${query/-img+}
            query=${query/-image+}
            option="photos"
    }
  elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
          then {
            query=${query/-vid+}
            query=${query/-video+}
            option="videos"
      }
  elif [ "$opParam" == '-page' ] || [ "$opParam" == '-pge' ]
              then {
                query=${query/-pge+}
                query=${query/-page+}
                option="pages"
      }
  elif [ "$opParam" == '-place' ] || [ "$opParam" == '-plc' ]
              then {
                query=${query/-plc+}
                query=${query/-place+}
                option="places"
      }
  elif [ "$opParam" == '-group' ] || [ "$opParam" == '-grp' ]
              then {
                query=${query/-grp+}
                query=${query/-group+}
                option="groups"
      }
  elif [ "$opParam" == '-apps' ] || [ "$opParam" == '-app' ]
              then {
                query=${query/-app+}
                query=${query/-apps+}
                option="apps"
      }
  elif [ "$opParam" == '-event' ] || [ "$opParam" == '-evt' ]
              then {
                query=${query/-evt+}
                query=${query/-event+}
                option="events"
      }
  elif [ "$opParam" == '-link' ] || [ "$opParam" == '-lnk' ]
              then {
                query=${query/-lnk+}
                query=${query/-link+}
                option="links"
      }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Facebook Search Filters: ${normal}
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
    query=${query/-fb+}
    query=${query/-facebook+}
    $browser www.facebook.com/search/$option/?q=$query
}
