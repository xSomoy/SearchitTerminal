# Amazon Search Function

function amazon() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-art' ] || [ "$opParam" == '-craft' ]
            then {
              query=${query/-art+}
              query=${query/-craft+}
              option="arts-crafts-intl-ship"
        }
    elif [ "$opParam" == '-automotive' ] || [ "$opParam" == '-auto' ]
            then {
              query=${query/-auto+}
              query=${query/-automotive+}
              option="automotive-intl-ship"
      }
    elif [ "$opParam" == '-baby' ] || [ "$opParam" == '-bby' ]
            then {
              query=${query/-bby+}
              query=${query/-baby+}
              option="baby-products-intl-ship"
      }
    elif [ "$opParam" == '-beauty' ] || [ "$opParam" == '-bty' ] || [ "$opParam" == '-personal' ]
            then {
              query=${query/-bty+}
              query=${query/-beauty+}
              query=${query/-personal+}
              option="beauty-intl-ship"
      }
    elif [ "$opParam" == '-book' ] || [ "$opParam" == '-bks' ]
            then {
              query=${query/-bks+}
              query=${query/-book+}
              option="stripbooks-intl-ship"
      }
    elif [ "$opParam" == '-computer' ] || [ "$opParam" == '-com' ]
            then {
              query=${query/-com+}
              query=${query/-computer+}
              option="computers-intl-ship"
      }
    elif [ "$opParam" == '-digitalmusic' ] || [ "$opParam" == '-dmc' ]
            then {
              query=${query/-dmc+}
              query=${query/-digitalmusic+}
              option="digital-music"
      }
    elif [ "$opParam" == '-electronics' ] || [ "$opParam" == '-elc' ]
            then {
              query=${query/-elc+}
              query=${query/-electronics+}
              option="electronics-intl-ship"
      }
    elif [ "$opParam" == '-kindle' ] || [ "$opParam" == '-kdl' ]
            then {
              query=${query/-kdl+}
              query=${query/-kindle+}
              option="digital-text"
      }
    elif [ "$opParam" == '-primevideo' ] || [ "$opParam" == '-pvd' ]
            then {
              query=${query/-pvd+}
              query=${query/-primevideo+}
              option="instant-video"
      }
    elif [ "$opParam" == '-women' ] || [ "$opParam" == '-wmn' ]
            then {
              query=${query/-wmn+}
              query=${query/-women+}
              option="fashion-womens-intl-ship"
      }
    elif [ "$opParam" == '-men' ] || [ "$opParam" == '-man' ]
            then {
              query=${query/-man+}
              query=${query/-men+}
              option="fashion-mens-intl-ship"
      }
    elif [ "$opParam" == '-girl' ] || [ "$opParam" == '-grl' ]
            then {
              query=${query/-grl+}
              query=${query/-girl+}
              option="fashion-girls-intl-ship"
      }
    elif [ "$opParam" == '-boys' ] || [ "$opParam" == '-boy' ]
            then {
              query=${query/-boy+}
              query=${query/-boys+}
              option="fashion-boys-intl-ship"
      }
    elif [ "$opParam" == '-deal' ] || [ "$opParam" == '-dls' ]
            then {
              query=${query/-dls+}
              query=${query/-deal+}
              option="deals-intl-ship"
      }
    elif [ "$opParam" == '-health' ] || [ "$opParam" == '-hlt' ] || [ "$opParam" == '-houshold' ]
            then {
              query=${query/-health+}
              query=${query/-hlt+}
              query=${query/-houshold+}
              option="hpc-intl-ship"
      }
    elif [ "$opParam" == '-home' ] || [ "$opParam" == '-hme' ] || [ "$opParam" == '-kitchen' ]
            then {
              query=${query/-hme+}
              query=${query/-home+}
              query=${query/-kitchen+}
              option="kitchen-intl-ship"
      }
    elif [ "$opParam" == '-industrial' ] || [ "$opParam" == '-ids' ]  || [ "$opParam" == '-science' ]  || [ "$opParam" == '-sci' ]
            then {
              query=${query/-industrial+}
              query=${query/-ids+}
              query=${query/-science+}
              query=${query/-sci+}
              option="industrial-intl-ship"
      }
    elif [ "$opParam" == '-luggage' ] || [ "$opParam" == '-lge' ]
            then {
              query=${query/-lge+}
              query=${query/-luggage+}
              option="luggage-intl-ship"
      }
    elif [ "$opParam" == '-movie' ] || [ "$opParam" == '-mvi' ] || [ "$opParam" == '-tv' ]
            then {
              query=${query/-movie+}
              query=${query/-mvi+}
              query=${query/-tv+}
              option="movies-tv-intl-ship"
      }
    elif [ "$opParam" == '-music' ] || [ "$opParam" == '-msc' ]
            then {
              query=${query/-msc+}
              query=${query/-music+}
              option="music-intl-ship"
      }
    elif [ "$opParam" == '-petsupply' ] || [ "$opParam" == '-pet' ]
            then {
              query=${query/-pet+}
              query=${query/-petsupply+}
              option="pets-intl-ship"
      }
    elif [ "$opParam" == '-software' ] || [ "$opParam" == '-sft' ]
            then {
              query=${query/-sft+}
              query=${query/-software+}
              option="software-intl-ship"
      }
    elif [ "$opParam" == '-sport' ] || [ "$opParam" == '-spt' ]
            then {
              query=${query/-spt+}
              query=${query/-sport+}
              option="sporting-intl-ship"
      }
    elif [ "$opParam" == '-tool' ] || [ "$opParam" == '-tls' ]
            then {
              query=${query/-tls+}
              query=${query/-tool+}
              option="tools-intl-ship"
      }
    elif [ "$opParam" == '-toy' ] || [ "$opParam" == '-toys' ]
            then {
              query=${query/-toy+}
              query=${query/-toys+}
              option="toys-and-games-intl-ship"
      }
    elif [ "$opParam" == '-game' ] || [ "$opParam" == '-gme' ]
            then {
              query=${query/-gme+}
              query=${query/-game+}
              option="videogames-intl-ship"
      }

    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "  ${aqua}${bold}Amazon Search Filters: ${normal}
                    For Arts & Crafts             -craft        -art
                    For Automotive                -automotive   -auto
                    For Baby                      -baby         -bby
                    For Beauty And Personal Care  -beauty       -bty     -personal
                    For Books                     -book         -bks
                    For Computers                 -computer     -com
                    For Digital Music             -digitalmusic -dmc
                    For Electronics               -electronics  -elc
                    For Kindle Store              -kindle       -kdl
                    For Prime Video               -primevideo   -pvd
                    For Women's Fashion           -women        -wmn
                    For Men's Fashion             -men          -man
                    For Girl's Fashion            -girl         -grl
                    For Boy's Fashion             -boys         -boy
                    For Deals                     -deal         -dls
                    For Health & Houshold         -health       -hlt     -houshold
                    For Home & Kitchen            -home         -hme     -kitchen
                    For Industrial & Scientific   -industrial   -ids     -science     -sci
                    For Luggage                   -luggage      -lge
                    For Movies & Tv               -movie        -mvi    -tv
                    For Music,CD,Vinyl            -music        -msc
                    For Pet Supplies              -petsupply    -pet
                    For Software                  -software     -sft
                    For Sports                    -sport        -spt
                    For Tools & Home Improvemnt   -tool         -tls
                    For Toys & Games              -toys         -toy
                    For Video Games               -game         -gme
                 "
            exit
      }
    else {
          option=""
        }
    fi
    query=${query/-amzn+}
    query=${query/-amazon+}
    $browser www.amazon.com/s/?k=$query\&i=$option
}
