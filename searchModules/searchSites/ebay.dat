# Ebay Search Function

function ebay() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-antique' ] || [ "$opParam" == '-atq' ]
            then {
              query=${query/-atq+}
              query=${query/-antique+}
              option="20081"
        }
    elif [ "$opParam" == '-art' ]
            then {
              query=${query/-art+}
              option="550"
      }
    elif [ "$opParam" == '-book' ] || [ "$opParam" == '-bks' ]
            then {
              query=${query/-bks+}
              query=${query/-book+}
              option="267"
      }
    elif [ "$opParam" == '-business' ] || [ "$opParam" == '-industrial' ] || [ "$opParam" == '-bsn' ] || [ "$opParam" == '-ids' ]
            then {
              query=${query/-business+}
              query=${query/-industrial+}
              query=${query/-bsn+}
              query=${query/-ids+}
              option="12576"
      }
    elif [ "$opParam" == '-camera' ] || [ "$opParam" == '-cmr' ] || [ "$opParam" == '-photo' ] || [ "$opParam" == '-pht' ]
            then {
              query=${query/-camera+}
              query=${query/-cmr+}
              query=${query/-photo+}
              query=${query/-pht+}
              option="625"
      }
    elif [ "$opParam" == '-clothe' ] || [ "$opParam" == '-shoe' ] || [ "$opParam" == '-clt' ] || [ "$opParam" == '-sho' ]
            then {
              query=${query/-clothe+}
              query=${query/-shoe+}
              query=${query/-clt+}
              query=${query/-sho+}
              option="11450"
      }
    elif [ "$opParam" == '-coin' ] || [ "$opParam" == '-money' ] || [ "$opParam" == '-cin' ] || [ "$opParam" == '-mny' ]
            then {
              query=${query/-coin+}
              query=${query/-money+}
              query=${query/-cin+}
              query=${query/-mny+}
              option="11116"
      }
    elif [ "$opParam" == '-collectibles' ] || [ "$opParam" == '-clt' ]
            then {
              query=${query/-clt+}
              query=${query/-collectibles+}
              option="1"
      }
    elif [ "$opParam" == '-computer' ] || [ "$opParam" == '-com' ]
            then {
              query=${query/-com+}
              query=${query/-computer+}
              option="58058"
      }
    elif [ "$opParam" == '-electronic' ] || [ "$opParam" == '-elc' ]
            then {
              query=${query/-elc+}
              query=${query/-electronic+}
              option="293"
      }
    elif [ "$opParam" == '-craft' ] || [ "$opParam" == '-cft' ]
            then {
              query=${query/-cft+}
              query=${query/-craft+}
              option="14339"
      }
    elif [ "$opParam" == '-doll' ] || [ "$opParam" == '-dll' ] || [ "$opParam" == '-bear' ] || [ "$opParam" == '-ber' ]
            then {
              query=${query/-dll+}
              query=${query/-doll+}
              query=${query/-bear+}
              query=${query/-ber+}
              option="237"
      }
    elif [ "$opParam" == '-movie' ] || [ "$opParam" == '-mve' ] || [ "$opParam" == '-dvd' ]
            then {
              query=${query/-dvd+}
              query=${query/-mve+}
              query=${query/-movie+}
              option="11232"
      }
    elif [ "$opParam" == '-motor' ] || [ "$opParam" == '-mtr' ]
            then {
              query=${query/-mtr+}
              query=${query/-motor+}
              option="6000"
      }
    elif [ "$opParam" == '-entertainment' ] || [ "$opParam" == '-ent' ]
            then {
              query=${query/-ent+}
              query=${query/-entertainment+}
              option="45100"
      }
    elif [ "$opParam" == '-everything' ] || [ "$opParam" == '-evy' ]
            then {
              query=${query/-evy+}
              query=${query/-everything+}
              option="99"
      }
    elif [ "$opParam" == '-coupon' ] || [ "$opParam" == '-cpn' ]
            then {
              query=${query/-cpn+}
              query=${query/-coupon+}
              option="172008"
      }
    elif [ "$opParam" == '-health' ] || [ "$opParam" == '-beauty' ] || [ "$opParam" == '-hlt' ] || [ "$opParam" == '-bty' ]
            then {
              query=${query/-bty+}
              query=${query/-hlt+}
              query=${query/-health+}
              query=${query/-beauty+}
              option="26395"
      }
    elif [ "$opParam" == '-home' ] || [ "$opParam" == '-garden' ] || [ "$opParam" == '-hme' ] || [ "$opParam" == '-grd' ]
            then {
              query=${query/-home+}
              query=${query/-garden+}
              query=${query/-hme+}
              query=${query/-grd+}
              option="11700"
      }
    elif [ "$opParam" == '-jewelry' ] || [ "$opParam" == '-jwl' ]
            then {
              query=${query/-jwl+}
              query=${query/-jewelry+}
              option="281"
      }
    elif [ "$opParam" == '-music' ] || [ "$opParam" == '-msc' ]
            then {
              query=${query/-msc+}
              query=${query/-music+}
              option="11233"
      }
    elif [ "$opParam" == '-instrument' ] || [ "$opParam" == '-ins' ]
            then {
              query=${query/-ins+}
              query=${query/-instrument+}
              option="619"
      }
    elif [ "$opParam" == '-petsupply' ] || [ "$opParam" == '-pet' ]
            then {
              query=${query/-pet+}
              query=${query/-petsupply+}
              option="1281"
      }
    elif [ "$opParam" == '-pottery' ] || [ "$opParam" == '-pot' ]
            then {
              query=${query/-pot+}
              query=${query/-pottery+}
              option="870"
      }
    elif [ "$opParam" == '-realstate' ] || [ "$opParam" == '-rst' ]
            then {
              query=${query/-rst+}
              query=${query/-realstate+}
              option="10542"
      }
    elif [ "$opParam" == '-service' ] || [ "$opParam" == '-svc' ]
            then {
              query=${query/-svc+}
              query=${query/-service+}
              option="316"
      }
    elif [ "$opParam" == '-sportinggood' ] || [ "$opParam" == '-sgd' ]
            then {
              query=${query/-sgd+}
              query=${query/-sportinggood+}
              option="888"
      }
    elif [ "$opParam" == '-sport' ] || [ "$opParam" == '-spt' ]
            then {
              query=${query/-sport+}
              query=${query/-spt+}
              option="64482"
      }
    elif [ "$opParam" == '-stamp' ] || [ "$opParam" == '-stm' ]
            then {
              query=${query/-stamp+}
              query=${query/-stm+}
              option="260"
      }
    elif [ "$opParam" == '-ticket' ] || [ "$opParam" == '-tkt' ]
            then {
              query=${query/-tkt+}
              query=${query/-ticket+}
              option="1305"
      }
    elif [ "$opParam" == '-toy' ] || [ "$opParam" == '-hobby' ] || [ "$opParam" == '-hby' ]
            then {
              query=${query/-hby+}
              query=${query/-toy+}
              query=${query/-hobby+}
              option="220"
      }
    elif [ "$opParam" == '-travel' ] || [ "$opParam" == '-tvl' ]
            then {
              query=${query/-travel+}
              query=${query/-tvl+}
              option="3252"
      }
    elif [ "$opParam" == '-game' ] || [ "$opParam" == '-gme' ]
            then {
              query=${query/-gme+}
              query=${query/-game+}
              option="1249"
      }
    elif [ "$opParam" == '-baby' ] || [ "$opParam" == '-bby' ]
            then {
              query=${query/-bby+}
              query=${query/-baby+}
              option="2984"
      }
    elif [ "$opParam" == '-phone' ] || [ "$opParam" == '-phn' ]
            then {
              query=${query/-phone+}
              query=${query/-phn+}
              option="15032"
      }
    elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
          then {
            echo "  ${aqua}${bold}Ebay Search Filters: ${normal}
                    For Antique                           -antique        -atq
                    For Art                               -art
                    For Baby                              -baby           -bby
                    For Book                              -book           -bks
                    For Business & Industrial             -business       -industrial      -bsn     -ids
                    For Camera & Photo                    -camera         -cmr             -photo   -pht
                    For Cell Phone & Accessories          -phone          -phn
                    For Clothes, Shoes & Accessories      -clothe         -shoe            -clt     -sho
                    For Coin & Paper Money                -coin           -money           -cin     -mny
                    For Collectibles                      -collectibles   -clt
                    For Computers                         -computer       -com
                    For Consumer Electronics              -electronic     -elc
                    For Crafts                            -craft          -cft
                    For Dolls & Bears                     -doll           -dll             -bear    -ber
                    For DVD's & Movies                    -movie          -mve             -dvd
                    For eBay Motors                       -motor          -mtr
                    For Entertainment                     -entertainment  -ent
                    For Everything Else                   -everything     -evy
                    For Gift Cards & Coupo                -coupon         -cpn
                    For Health & Beauty                   -health         -beauty           -hlt     -bty
                    For Home & Garden                     -home           -garden           -hme     -grd
                    For Jewelry & Watches                 -jewelry        -jwl
                    For Music                             -music          -msc
                    For Musical Instrument                -instrument     -ins
                    For Pet Supplies                      -petsupply      -pet
                    For Pottery & Glass                   -pottery        -pot
                    For Real States                       -realstate      -rst
                    For Specialty Service                 -service        -svc
                    For Sporting Good                     -sportinggood   -sgd
                    For Sports                            -sport          -spt
                    For Stamps                            -stamp          -stm
                    For Tickets & Experience              -ticket         -tkt
                    For Toys And Hobbies                  -toy            -hobby            -hby
                    For Travel                            -travel         -tvl
                    For Video Games                       -game           -gme
               "
            exit
      }
    else {
          option=""
        }
    fi
    query=${query/-eby+}
    query=${query/-ebay+}
    $browser www.ebay.com/sch/i.html?_nkw=$query\&_sacat=$option
}
