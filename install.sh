#!/bin/bash

#            --------------------------------------------------
#                              Camera Snapshot               
#            --------------------------------------------------
#                  Copyright (C) <2019>  <Entynetproject>      
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

RS="\033[1;31m"
YS="\033[1;33m"
CE="\033[0m"

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e ""$RS"["$CE"-"$RS"] This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

if [[ -d ~/camsnap ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/entynetproject/camsnap.git
} &> /dev/null
fi

sleep 0.5
clear
sleep 0.5
cd ~/camsnap
printf "\033[1;92m   ____               \033[0m\033[1;77m ____                    \033[0m\n"
printf "\033[1;92m  / ___|__ _ _ __ ___ \033[0m\033[1;77m/ ___| _ __   __ _ _ __  \033[0m\n"
printf "\033[1;92m | |   / _\` | '_ \` _ \\\\\033[0m\033[1;77m\___ \| '_ \ / _\` | '_ \ \033[0m\n"
printf "\033[1;92m | |__| (_| | | | | | |\033[0m\033[1;77m___) | | | | (_| | |_) |\033[0m\n"
printf "\033[1;92m  \____\__,_|_| |_| |_|\033[0m\033[1;77m____/|_| |_|\__,_| .__/ \033[0m\n"
printf "\033[1;92m                       \033[0m\033[1;77m                 |_|    \033[0m\n"
echo

sleep 1
echo -e "\033[1;77m[\033[0m\033[1;93m*\033[0m\033[1;77m] Installing dependencies...\033[0m"
sleep 1

{
pkg update
pkg -y install git
pkg -y install curl
pkg -y install php
pkg -y install openssh
pkg -y install unzip
pkg -y install wget
apt-get update
apt-get -y install git
apt-get -y install curl
apt-get -y install php
apt-get -y install openssh-server
apt-get -y install unzip
apt-get -y install wget
apk update
apk add git
apk add curl
apk add php
apk add openssh
apk add unzip
apk add wget
pacman -Sy
pacman -S --noconfirm git
pacman -S --noconfirm curl
pacman -S --noconfirm php
pacman -S --noconfirm openssh
pacman -S --noconfirm unzip
pacman -S --noconfirm wget
zypper refresh
zypper install -y git
zypper install -y curl
zypper install -y php
zypper install -y openssh
zypper install -y unzip
zypper install -y wget
yum -y install git
yum -y install curl
yum -y install php
yum -y install openssh
yum -y install unzip
yum -y install wget
dnf -y install git
dnf -y install curl
dnf -y install php
dnf -y install openssh
dnf -y install unzip
dnf -y install wget
eopkg update-repo
eopkg -y install git
eopkg -y install curl
eopkg -y install php
eopkg -y install openssh
eopkg -y install unzip
eopkg -y install wget
xbps-install -S
zbps-install -y git
xbps-install -y curl
xbps-install -y php
xbps-install -y openssh
xbps-install -y unzip
xbps-install -y wget
} &> /dev/null

{
cd ~/camsnap/bin
cp camsnap /usr/local/bin
chmod +x /usr/local/bin/camsnap
cp camsnap /bin
chmod +x /bin/camsnap
cp camsnap /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/camsnap
} &> /dev/null

sleep 1
echo -e "\033[0;92m[\033[0m+\033[0;92m] Successfully installed!\033[0m"
sleep 1
