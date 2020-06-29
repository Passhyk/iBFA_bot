#!/bin/bash
#if you get any problems with that contact me via > github.com/YurinDoctrine
#or you just google it :)

checkroot() {
if [[ "$(id -u)" -ne 0 ]]; then
    printf "Please, run this program as root! Aborting... \n"
    exit 1
fi
}


dependencies() {
command -v wget > /dev/null 2>&1 || { echo >&2 "wget Not found, installing..."; sudo apt-get install wget -y; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "unzip Not found, installing..."; sudo apt-get install unzip -y; }
command -v google-chrome-stable > /dev/null 2>&1 || { echo >&2 "google-chrome-stable Not found, installing..."; wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -; sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list';sudo apt-get update && sudo apt-get install google-chrome-stable -y; }
command -v chromedriver > /dev/null 2>&1 || { echo >&2 "chromedriver Not found, installing..."; wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip; unzip chromedriver_linux64.zip; rm -rf chromedriver_linux64.zip; sudo mv chromedriver /usr/local/bin; }
}

checkroot
dependencies
clear
#time to execute bot.py
main() {
python3 bot.py

}

banner() {
printf "\n\e[1;77m\e[45m   Instagram Brute Force Attack by selenium.webdriver v1.0 Author: YURIN \e[0m\n"
printf "\n"
printf 'The Author(ME) do not take any responsibilities and this script belongs to the educational purposes.\n'
read -p $'\e[1;92mDO YOU TAKE ANY RESPONSIBILITIES y/N? \e[0m' lock
if [[ "$lock" == "Y" || "$lock" == "y" || "$lock" == "yes" || "$lock" == "Yes" ]]; then
printf 'Aight kiddo! :)\n'
printf 'BFA has began hold on!\n' && main
fi
if [[ "$lock" == "N" || "$lock" == "n" || "$lock" == "no" || "$lock" == "No" ]]; then
printf "Cy@ do not look back :)\n"
exit 1
fi

}

banner



