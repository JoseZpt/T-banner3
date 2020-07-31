#!/bin/bash
pkg install figlet -y
echo -e "\033[1;32m$(figlet T-banner3)\033[0m"
pkg install toilet -y
echo -e "\033[1;32m$(figlet Toilet)\033[0m"
pkg install nano -y
echo -e "\033[1;32m$(figlet Cowsay)\033[0m"
pkg install cowsay -y
