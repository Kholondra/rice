#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then printf "The script has to be run as root.\n"
  exit
fi

cd ..
userhome=$(pwd)

pacman -Syyyy --noconfirm --needed xorg-server xorg-xinit libxinerama libxft feh unclutter unzip ttf-font-awesome ttf-hack
printf "installed dependencies\n"

mkdir /etc/rice/
mv $userhome/rice/rice.zip /etc/rice/
mv $userhome/rice/dots.zip /$userhome
printf "moved zips\n"

cd /$userhome
unzip dots.zip
cd /etc/rice
unzip rice.zip
printf "unzipped\n"

cd /etc/rice/dwm
make clean install
printf "installed dwm\n"
cd /etc/rice/dmenu
make clean install
printf "installed dmenu\n"
cd /etc/rice/slstatus
make clean install
printf "installed slstatus\n"
cd /etc/rice/st
make clean install
printf "installed st\n"


printf "Install finished.\n"