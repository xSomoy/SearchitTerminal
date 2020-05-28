# Config Check Function

function configCheck() {
  if [ -f ~/.config/SearchitTerminal/searchit.cfg ]
    then
      :
  else {
    cd /usr/share/SearchitTerminal
    ./logo
    echo ""
    echo "${orange}Please Select Default Configuration For Current User${normal}"
    echo ""
    browserCheck
    defaultEngine
    if [ -d ~/.config/SearchitTerminal/ ]
    then
      :
    else {
      mkdir ~/.config/SearchitTerminal
    }
    fi
    cd ~/.config/SearchitTerminal/
    cat  >> searchit.cfg <<CONFIGEND
Searchit Configuration File.
Please Do Not Make Any Change To This File.
Use Command "searchit -cfg" To Make Any Changes
----------------------------------

Default Browser: $var1
Default Search Engine: $var2
CONFIGEND
echo "Default Configuration Has Been Set!"
  }
fi
}
