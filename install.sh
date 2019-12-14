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

if [[ -f /etc/camsnap.conf ]]
then

CONF="$( cat /etc/camsnap.conf )"
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else 
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
pkg update
pkg -y install curl
pkg -y install php
pkg -y install ssh
pkg -y install unzip
pkg -y install wget
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
apt-get update
apt-get -y install curl
apt-get -y install php
apt-get -y install ssh
apt-get -y install unzip
apt-get -y install wget
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
apt-get update
apt-get -y install curl
apt-get -y install php
apt-get -y install ssh
apt-get -y install unzip
apt-get -y install wget
fi
fi

else
read -e -p $'\033[1;92m[\033[0m\033[1;77m+\033[0m\033[1;92m] Select your architecture (amd/intel/arm): \033[0m' CONF
if [[ "$CONF" = "" ]]
then
exit
else
if [[ "$CONF" = "arm" ]]
then
read -e -p $'\033[1;92m[\033[0m\033[1;77m+\033[0m\033[1;92m] Is this a single board computer (yes/no)? \033[0m' PI
if [[ "$PI" = "yes" ]]
then
echo "amd" >> /etc/camsnap.conf
CONF="amd"
else
echo "$CONF" >> /etc/camsnap.conf
fi
else
echo "$CONF" >> /etc/camsnap.conf
fi
fi
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else 
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
pkg update
pkg -y install curl
pkg -y install php
pkg -y install ssh
pkg -y install unzip
pkg -y install wget
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
apt-get update
apt-get -y install curl
apt-get -y install php
apt-get -y install ssh
apt-get -y install unzip
apt-get -y install wget
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
else
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing dependencies...\033[0m"
apt-get update
apt-get -y install curl
apt-get -y install php
apt-get -y install ssh
apt-get -y install unzip
apt-get -y install wget
fi
fi
fi

{
cd ~/camsnap/bin
cp camsnap /usr/local/bin
chmod +x /usr/local/bin/camsnap
cp camsnap /bin
chmod +x /bin/camsnap
cp camsnap /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/camsnap
} &> /dev/null
