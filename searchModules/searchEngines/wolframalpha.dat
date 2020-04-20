# wolframalpha Search Function

function wolframalpha() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "${aqua}${bold}NOTE: Wolfram|Alpha doesn't have any search filters.${normal}"
            exit
      }
    else {
      query=${query/-wfa+}
      query=${query/-wolframalpha+}
      $browser www.wolframalpha.com/input/?i=$query
        }
    fi
}
