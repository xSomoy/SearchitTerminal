# Reddit Search Function

function reddit() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-post' ] || [ "$opParam" == '-pst' ]
            then {
              query=${query/-pst+}
              query=${query/-post+}
              option="link"
        }
    elif [ "$opParam" == '-user' ] || [ "$opParam" == '-usr' ]
            then {
              query=${query/-usr+}
              query=${query/-user+}
              option="sr%2Cuser"
      }
    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo " ${aqua}${bold}Reddit Search Filters: ${normal}
                    For Posts                  -post      -pst
                    For Communities and users  -user      -usr
                 "
            exit
      }
    else {
          option=""
        }
    fi
    query=${query/-rddt+}
    query=${query/-reddit+}
    $browser www.reddit.com/search?q=$query\&type=$option
}
