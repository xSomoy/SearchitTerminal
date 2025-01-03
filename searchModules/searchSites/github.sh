# Github Search Function

function github() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-repository' ] || [ "$opParam" == '-rep' ]
            then {
              query=${query/-rep+}
              query=${query/-repository+}
              option="Repositories"
        }
    elif [ "$opParam" == '-code' ] || [ "$opParam" == '-cde' ]
            then {
              query=${query/-cde+}
              query=${query/-code+}
              option="Code"
      }
    elif [ "$opParam" == '-commit' ] || [ "$opParam" == '-cmt' ]
            then {
              query=${query/-cmt+}
              query=${query/-commit+}
              option="Commits"
      }
    elif [ "$opParam" == '-issue' ] || [ "$opParam" == '-isu' ]
            then {
              query=${query/-isu+}
              query=${query/-issue+}
              option="Issues"
      }
    elif [ "$opParam" == '-package' ] || [ "$opParam" == '-pac' ]
            then {
              query=${query/-pac+}
              query=${query/-package+}
              option="RegistryPackages"
      }
    elif [ "$opParam" == '-market' ] || [ "$opParam" == '-mkt' ]
            then {
              query=${query/-mkt+}
              query=${query/-market+}
              option="Marketplace"
      }
    elif [ "$opParam" == '-topic' ] || [ "$opParam" == '-tpc' ]
            then {
              query=${query/-tpc+}
              query=${query/-topic+}
              option="Topics"
      }
    elif [ "$opParam" == '-wiki' ] || [ "$opParam" == '-wki' ]
            then {
              query=${query/-wki+}
              query=${query/-wiki+}
              option="Wikis"
      }
    elif [ "$opParam" == '-user' ] || [ "$opParam" == '-usr' ]
            then {
              query=${query/-usr+}
              query=${query/-user+}
              option="Users"
      }
    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "  ${aqua}${bold}Github Search Filters: ${normal}
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
    query=${query/-gthb+}
    query=${query/-github+}
    $browser www.github.com/search/?q=$query\&type=$option
}
