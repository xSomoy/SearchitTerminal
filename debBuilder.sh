#!/usr/bin/env bash

version=0.0-alpha0

# Some colors to draw you fucking attension

normal=`echo -en "\e[0m"`
red=`echo -en "\e[31m"`
orange=`echo -en "\e[33m"`

# Checking All Files Are Available

function fileCheck() {
  echo "Checking if all files are available to create a debian package"
  sleep .5s

  if [ -f /usr/bin/searchit ]
  then
    echo "File: \"searchit\" found.."
  else {
    echo "${red}File: \"searchit\" is not found..${normal}"
    echo "${orange}File: \"searchit\" should be in \"/usr/bin/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/bin/duckit ]
  then
    echo "File: \"duckit\" found.."
  else {
    echo "${red}File: \"duckit\" is not found..${normal}"
    echo "${orange}File: \"duckit\" should be in \"/usr/bin/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/bin/googleit ]
  then
    echo "File: \"googleit\" found.."
  else {
    echo "${red}File: \"googleit\" is not found..${normal}"
    echo "${orange}File: \"googleit\" should be in \"/usr/bin/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/share/SearchitTerminal/logo ]
  then
    echo "File: \"logo\" found.."
  else {
    echo "${red}File: \"logo\" is not found..${normal}"
    echo "${orange}File: \"logo\" should be in \"/usr/share/Searchit Terminal/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/share/SearchitTerminal/README.txt ]
  then
    echo "File: \"README.txt\" found.."
  else {
    echo "${red}File: \"README.txt\" is not found..${normal}"
    echo "${orange}File: \"README.txt\" should be in \"/usr/share/Searchit Terminal/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/share/SearchitTerminal/releaseNote ]
  then
    echo "File: \"releaseNote\" found.."
  else {
    echo "${red}File: \"releaseNote\" is not found..${normal}"
    echo "${orange}File: \"releaseNote\" should be in \"/usr/share/Searchit Terminal/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/share/SearchitTerminal/SearchitTerminal.png ]
  then
    echo "File: \"SearchitTerminal.png\" found.."
  else {
    echo "${red}File: \"SearchitTerminal.png\" is not found..${normal}"
    echo "${orange}File: \"SearchitTerminal.png\" should be in \"/usr/share/Searchit Terminal/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f /usr/share/applications/SearchitTerminal.desktop ]
  then
    echo "File: \"Searchit Terminal.desktop\" found.."
  else {
    echo "${red}File: \"Searchit Terminal.desktop\" is not found..${normal}"
    echo "${orange}File: \"Searchit Terminal.desktop\" should be in \"/usr/share/applications//\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -d debian/ ]
  then
    echo "Directory: \"debian\" found.."
  else {
    echo "${red}Directory: \"debian\" is not found..${normal}"
    echo "${orange}Directory: \"debian\" should be in \"Current Directory\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -d debian/source/ ]
  then
    echo "Directory: \"debian/source\" found.."
  else {
    echo "${red}Directory: \"debian/source\" is not found..${normal}"
    echo "${orange}Directory: \"debian/source\" should be in \"Current Directory/debian/source\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/source/format ]
  then
    echo "File: \"format\" found.."
  else {
    echo "${red}File: \"format\" is not found..${normal}"
    echo "${orange}File: \"format\" should be in \"Current Directory/debian/source/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/changelog ]
  then
    echo "File: \"changelog\" found.."
  else {
    echo "${red}File: \"changelog\" is not found..${normal}"
    echo "${orange}File: \"changelog\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/compat ]
  then
    echo "File: \"compat\" found.."
  else {
    echo "${red}File: \"compat\" is not found..${normal}"
    echo "${orange}File: \"compat\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/control ]
  then
    echo "File: \"control\" found.."
  else {
    echo "${red}File: \"control\" is not found..${normal}"
    echo "${orange}File: \"control\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/changelog ]
  then
    echo "File: \"copyright\" found.."
  else {
    echo "${red}File: \"copyright\" is not found..${normal}"
    echo "${orange}File: \"copyright\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/postinst ]
  then
    echo "File: \"postinst\" found.."
  else {
    echo "${red}File: \"postinst\" is not found..${normal}"
    echo "${orange}File: \"postinst\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/preinst ]
  then
    echo "File: \"preinst\" found.."
  else {
    echo "${red}File: \"preinst\" is not found..${normal}"
    echo "${orange}File: \"preinst\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s

  if [ -f debian/control ]
  then
    echo "File: \"control\" found.."
  else {
    echo "${red}File: \"control\" is not found..${normal}"
    echo "${orange}File: \"control\" should be in \"Current Directory/debian/\"${normal}"
    exit
  }
  fi
  sleep .5s
  echo "All files are found"
}

function packInfo() {
  echo -n "Version Number:"
  read ver
  filename="searchit-terminal-$ver"
  mkdir "$filename"
}

function collectFile() {
  cd searchit-terminal-"$ver"/
  dir=$(pwd)
  cp /usr/bin/searchit $dir
  cp /usr/bin/duckit $dir
  cp /usr/bin/googleit $dir
  cp /usr/share/SearchitTerminal/logo $dir
  cp /usr/share/SearchitTerminal/README.txt $dir
  cp /usr/share/SearchitTerminal/releaseNote $dir
  cp /usr/share/SearchitTerminal/SearchitTerminal.png $dir
  cp /usr/share/applications/SearchitTerminal.desktop $dir

}

function checkDep() {
  dep0=$(which fakeroot)
  dep1=$(which dh_make)
  if [ -n "$dep0" ] && [ -n "$dep1" ]
  then
    echo "All dependencies are availavle "
  else {
    if [ -n "$dep0" ]
    then {
      echo "${red}\"fakeroot is not installed\"${normal}"
      echo "Installing fakeroot"
      sudo apt install fakeroot
    }
    fi
    if [ -n "$dep1" ]
    then {
      echo "${red}\"dh_make is not installed\"${normal}"
      echo "Installing dh_make"
      sudo apt install dh_make
    }
    fi

  }
fi
}

function debBuild() {
  cd ..
  tar -cf searchit-terminal-"$ver".tar.xz "$filename"
  sudo chmod 777 searchit-terminal-"$ver".tar.xz
  mv searchit-terminal-"$ver".tar.xz "$filename"/
  cd "$filename"
  dh_make -f searchit-terminal-"$ver".tar.xz
  rm  searchit-terminal_"$ver".tar.xz
  rm -r debian
  cd ..
  cp -r debian "$filename"/
  cd "$filenam"
  fakeroot dpkg-buildpackage -F
}


# calling all functions

fileCheck
packInfo
collectFile
checkDep
debBuild

echo "debian package is build"