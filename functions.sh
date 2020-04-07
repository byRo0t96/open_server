#!/bin/bash
# v.0.0.1
# open_server
# Coded by: Ro0t-96
# Github: https://github.com/byRo0t96
#!/bin/bash
printf '\033]2;open_server\a'

trap 'printf "";stopphp;exit 1' 1

server="server"
#########################downloads
server() {
if [[ -e $server ]]; then
echo 
else
mkdir $server
fi
}
server
#########################dependencies
dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "php it's not installed. Install it..."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "curl it's not installed. Install it..."; exit 1; }
}
#########################unzipwget
unzipwget(){
command -v unzip > /dev/null 2>&1 || { echo >&2 "unzip it's not installed. Install it..."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "wget it's not installed. Install it..."; exit 1; }
}
#########################downloads
downloads() {
if [[ -e downloads ]]; then
echo 
else
mkdir downloads
fi
}
#########################download
downloadngrok(){
downloads
cd downloads
if [[ -e ngrok ]]; then
echo ""
else
unzipwget
printf "Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "Download error... Termux, run: pkg install wget\n"
exit 1
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "Download error... \n"
exit 1
fi
fi
fi
cd ..
}
#########################
stopphp() {
printf "Stoping php server...\n"
sleep 3
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
printf "php server is stoped\n"
}
#########################
stopln() {
printf "Stoping local network...\n"
sleep 3
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkphp == *'php'* ]]; then
sudo pkill -f -2 php > /dev/null 2>&1
sudo killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
sudo pkill -f -2 ssh > /dev/null 2>&1
sudo killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
sudo printf "local network is stoped\n"
}
#########################
stopngrok() {
printf "Stoping ngrok server...\n"
sleep 3
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
printf "ngrok server is stoped\n"
}
#########################
startphp() {
printf "Starting php server...\n"
sleep 3
cd $server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
link_h="http://127.0.0.1:3333"
printf "php server is started\n"
sleep 1
printf "localhost:%s\n" $link_h
}
#########################
startln() {
printf "Starting local network...\n"
sleep 3
default_ip=$(hostname -I)
printf "Put your local IP (Default %s): " $default_ip
read ip
ip="${ip:-${default_ip}}"
sudo php -t "$server" -S "$ip:80" > /dev/null 2>&1 & 
printf "local network is started\n"
sleep 1
printf "local network:http://%s\n" $ip
}
#########################
startngrok() {
printf "Starting ngrok server ...\n"
sleep 3
downloadngrok
downloads/ngrok http 3333 > /dev/null 2>&1 &
sleep 10
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "ngrok server is started\n"
sleep 1
printf "ngrok.io:%s\n" $link
}
#########################
openphp() {
gio open "http://127.0.0.1:3333"
}
#########################
openln() {
default_ip=$(hostname -I)
#printf "Put your local IP (Default %s): " $default_ip
#read ip
#ip="${$ip:-${default_ip}}"
#last="http://%s" $ip
#printf "$last"
gio open "http://$default_ip"
}
#########################
openngrok() {
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
gio open "$link"
}
#########################
Exit() {
stopphp
stopln
stopngrok
}
#########################
case $1 in 
		startphp)
		startphp
                exit
		;;

		startln)
		startln
                exit
		;;

		startngrok)
		startngrok
                exit
		;;

		stopphp)
		stopphp
                exit
		;;

		stopln)
		stopln
                exit
		;;

		stopngrok)
		stopngrok
                exit
		;;

		openphp)
		openphp
                exit
		;;

		openln)
		openln
                exit
		;;

		openngrok)
		openngrok
                exit
		;;

		Exit)
		Exit
                exit
		;;
esac
