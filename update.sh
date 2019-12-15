if [[ -d /data/data/com.termux ]]
then
if [[ -f /data/data/com.termux/files/usr/bin/camsnap ]]
then
UPD="true"
else
UPD="false"
fi
else 
if [[ -f /usr/local/bin/camsnap ]]
then
UPD="true"
else
UPD="false"
fi
fi
{
ASESR="$( curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' )"
} &> /dev/null
if [[ "$ASESR" = "" ]]
then 
sleep 1
echo ""$RS"["$CE"-"$RSA"] Download failed!"$CE""
sleep 1
exit
fi
if [[ $EUID -ne 0 ]]
then
sleep 1
echo ""$RS"["$CE"-"$RSA"] Permission denied!"$CE""
sleep 1
exit
fi
sleep 1
echo -e "\033[1;77m[\033[0m\033[1;93m+\033[0m\033[1;77m] Installing update...\033[0m"
{
mkdir ~/.camsnap
cp -r ~/camsnap/images ~/.camsnap
rm -rf ~/camsnap
rm /bin/camsnap
rm /usr/local/bin/camsnap
rm /data/data/com.termux/files/usr/bin/camsnap
cd ~
git clone https://github.com/entynetproject/camsnap.git
if [[ "$UPD" != "true" ]]
then
sleep 0
else
cd camsnap
chmod +x install.sh
./install.sh
fi
cp -r ~/.camsnap/images ~/camsnap
rm -rf ~/.camsnap
} &> /dev/null
echo ""$GNS"["$CE"+"$GSA"] Successfully updated!"$CE""
sleep 1
exit
