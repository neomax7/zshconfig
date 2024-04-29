#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}install ${RED}xremap ${GREEN}and select proper ${RED}frontend ${GREEN}dependency ${NC}(KDE/GNOME)"
yay -S xremap && printf "${NC}==> ${GREEN}Done\n"
printf "${RED}copying service file to etc/systemd"
sudo cp -v ./xremap.service /etc/systemd/system/ && printf "${NC}==> ${GREEN}Done\n"
printf "${RED}copying yaml config to local/etc"
sudo cp -v ./xremap.yaml /usr/local/etc/ && printf "${NC}==> ${GREEN}Done\n"
printf "${RED}daemon reload"
sudo systemctl daemon-reload && printf "${NC}==> ${GREEN}Done\n"
printf "${RED}enabling xremap  service"
sudo systemctl enable --now xremap.service && printf "${NC}==> ${GREEN}Done\n"
