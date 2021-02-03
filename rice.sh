#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then printf "The script has to be run as root.\n"
  exit
fi

cd ..
userhome=$(pwd)

pacman -Sy --noconfirm xorg-server xorg-xinit libxinerama libxft feh unclutter unzip ttf-font-awesome

mv $userhome/rice/rice.zip $userhome

cd $userhome
unzip rice.zip

mkdir /usr/share/fonts/Instruction/
mv instruction.zip /usr/share/fonts/Instruction/
cd /usr/share/fonts/Instruction
unzip instruction.zip
cd $userhome
mkdir /usr/share/fonts/MonospaceTypewriter/
mv monospace_typewrite.zip /usr/share/fonts/MonospaceTypewriter/
cd /usr/share/fonts/MonospaceTypewriter
unzip monospace_typewrite.zip

cd $userhome/dwm
make clean install
printf "installed dwm\n"
cd $userhome/dmenu
make clean install
printf "installed dmenu\n"
cd $userhome/slstatus
make clean install
printf "installed slstatus\n"
cd $userhome/st
make clean install
printf "installed st\n"


printf "Install finished.\n"