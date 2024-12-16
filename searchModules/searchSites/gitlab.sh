# Gitlab Search Fucntion

function gitlab() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-issue' ] || [ "$opParam" == '-isu' ]
            then {
              query=${query/-isu+}
              query=${query/-issue+}
              option="issues"
        }
    elif [ "$opParam" == '-merge' ] || [ "$opParam" == '-mrg' ]
            then {
              query=${query/-mrg+}
              query=${query/-merge+}
              option="merge_request"
      }
    elif [ "$opParam" == '-milestone' ] || [ "$opParam" == '-stn' ]
            then {
              query=${query/-stn+}
              query=${query/-milestone+}
              option="milestones"
      }
    elif [ "$opParam" == '-user' ] || [ "$opParam" == '-usr' ]
            then {
              query=${query/-usr+}
              query=${query/-user+}
              option="users"
      }
    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "  ${aqua}${bold}Gitlab Search Filters: ${normal}
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
    query=${query/-gtlb+}
    query=${query/-gitlab+}
    $browser www.gitlab.com/search?search=$query\&scope=$option
}
