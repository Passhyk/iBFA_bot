#!/bin/bash
#if you get any problems with that contact me via > github.com/YurinDoctrine
#or you just google it :)


dependencies() {
command -v wget > /dev/null 2>&1 || { echo >&2 "wget Not found, installing..."; sudo apt-get install wget -y; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "unzip Not found, installing..."; sudo apt-get install unzip -y; }
command -v python3-pip > /dev/null 2>&1 || { echo >&2 "python3-pip Not found, installing..."; sudo apt-get install python3-pip -y; }
command -v tor > /dev/null 2>&1 || { echo >&2 "tor Not found, installing..."; sudo apt-get install tor -y; }
command -v google-chrome-stable > /dev/null 2>&1 || { echo >&2 "google-chrome-stable Not found, installing..."; wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -; sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list';sudo apt-get update && sudo apt-get install google-chrome-stable -y; }
command -v chromedriver > /dev/null 2>&1 || { echo >&2 "chromedriver Not found, installing..."; wget https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip; unzip chromedriver_linux64.zip; rm -rf chromedriver_linux64.zip; sudo mv chromedriver /usr/local/bin; }
}

dependencies
clear

privatesession() {
read -p $'\e[1;93mDO YOU WANT OPEN PRIVATE SESSION(RECOMMENDED)? \e[0m' nock 
if [[ "$nock" == "Y" || "$nock" == "y" || "$nock" == "yes" || "$nock" == "Yes" ]]; then
printf 'Aight kiddo! :)\e[0m\n'
printf 'BRUTE FORCE ATTACK JUST BEGAN! \e[1;93m\n' && main
fi
if [[ "$nock" == "N" || "$nock" == "n" || "$nock" == "no" || "$nock" == "No" ]]; then
printf 'BRUTE FORCE ATTACK JUST BEGAN \e[1;91mWITHOUT NO PRIVACY(!) \e[1;93m\n' && main
fi

}

#time to execute bot.py
main() {
python3 bot.py

}

banner() {
printf '\n\e[1;92m  Instagram Brute Force Attack by \e[1;95m\e[42mselenium.chrome.webdriver v1.0\e[0m\e[1;92m Author: YURIN \n'
printf '\n\e[1;94m  The Author(ME) do not take any responsibilities and this script belongs to the educational purposes.  \e[0m\n'
read -p $'\n\e[1;91mDO YOU TAKE ANY RESPONSIBILITIES y/N? \e[0m' lock
if [[ "$lock" == "Y" || "$lock" == "y" || "$lock" == "yes" || "$lock" == "Yes" ]]; then
privatesession
fi
if [[ "$lock" == "N" || "$lock" == "n" || "$lock" == "no" || "$lock" == "No" ]]; then
	printf '\e[1;95m\e[42mCy@ do not look back :)\e[0m\n'
exit 1
fi

}

banner



