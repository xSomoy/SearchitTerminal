# Tumblr Search Function

function tumblr() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "${aqua}${bold}NOTE: Tumblr doesn't have any search filters.${normal}"
            exit
      }
    else {
      query=${query/-tmblr+}
      query=${query/-tumblr+}
      $browser www.tumblr.com/search/$query
        }
    fi
}
