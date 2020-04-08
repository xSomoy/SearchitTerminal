# Wikipedia Search Function

function wikipedia() {
    dbCheck
    query=${tmpquery//\ /+}
  if [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
        then {
          echo "${aqua}${bold}NOTE: Wikipedia doesn't have any search filters.${normal}"
          exit
    }
  else {
    query=${query/-wiki+}
    query=${query/-wikipedia+}
    $browser www.wikipedia.org/wiki/?search=$query
      }
  fi
}
