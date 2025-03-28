# Baidu Search Function

function baidu() {
    dbCheck
    query=${tmpquery//\ /+}
    if [ "$opParam" == '-image' ]  || [ "$opParam" == '-img' ]
        then {
          query=${query/-img+}
          query=${query/-image+}
          query=${query/-bdu+}
          query=${query/-baidu+}
          $browser image.baidu.com/search/index?tn=baiduimage\&word=$query
          exit
       }
    elif [ "$opParam" == '-video' ] || [ "$opParam" == '-vid' ]
        then {
          query=${query/-vid+}
          query=${query/-video+}
          query=${query/-bdu+}
          query=${query/-baidu+}
          $browser www.baidu.com/sf/vsearch?pd=video\&wd=$query
          exit
    }
    elif [ "$opParam" == '-news' ] || [ "$opParam" == '-nws' ]
        then {
          query=${query/-nws+}
          query=${query/-news+}
          query=${query/-bdu+}
          query=${query/-baidu+}
          $browser www.baidu.com/s?tn=news\&word=$query
          exit

    }
  elif [ "$opParam" == '-maps' ] || [ "$opParam" == '-map' ]
          then {
            query=${query/-map+}
            query=${query/-maps+}
            query=${query/-bdu+}
            query=${query/-baidu+}
            $browser map.baidu.com/search/?querytype=s\&wd=$query
            exit
    }
  elif [ "$opParam" == '-academic' ] || [ "$opParam" == '-aca' ]
          then {
            query=${query/-aca+}
            query=${query/-academic+}
            query=${query/-bdu+}
            query=${query/-baidu+}
            $browser xueshu.baidu.com/s?wd=$query
            exit
    }
  elif [ "$opParam" == '-music' ] || [ "$opParam" == '-msc' ]
          then {
            query=${query/-msc+}
            query=${query/-music+}
            query=${query/-bdu+}
            query=${query/-baidu+}
            $browser music.taihe.com/search?key=$query
            exit
    }
  elif [ "$opParam" == '-know' ] || [ "$opParam" == '-knw' ]
          then {
            query=${query/-knw+}
            query=${query/-know+}
            query=${query/-bdu+}
            query=${query/-baidu+}
            $browser zhidao.baidu.com/search?word=$query
            exit
    }
  elif [ "$opParam" == '-help' ] || [ "$opParam" == '-h' ] || [ "$opParam" == '-?' ]
      then {
        echo " ${aqua}${bold}Baidu Search Filters: ${normal}
                For Images     -image       -img
                For Videos     -video       -vid
                For News       -news        -nws
                For Maps       -maps        -map
                For Music      -music       -msc
                For Academic   -academic    -aca
                For Know       -know        -knw
        "
        exit
  }
    else {
      query=${query/-bdu+}
      query=${query/-baidu+}
      $browser www.baidu.com/s?wd=$query
      exit
    }
  fi
}
