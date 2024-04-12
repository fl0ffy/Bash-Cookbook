#!/bin/bash

Black='\e[0;30m'
DarkGray='\e[1;30m'
Blue='\e[0;34m'
LightBlue='\e[1;34m'
Green='\e[0;32m'
LightGreen='\e[1;32m'
Cyan='\e[0;36m'
LightCyan='\e[1;36m'
Red='\e[0;31m'
LightRed='\e[1;31m'
Purple='\e[0;35m'
LightPurple='\e[1;35m'
Brown='\e[0;33m'
Yellow='\e[1;33m'
LightGray='\e[0;37m'
White='\e[1;37m'
#
NC='\e[0m' # No Color


echo -e "${Blue}Hello Color Change Test${NC}"
echo -e "${Green}Hello Color Change Test${NC}"
echo -e "${Yellow}Hello Color Change Test${NC}"
echo -e "${Black}Hello Color Change Test${NC}"
echo -e "${Red}Hello Color Change Test${NC}"
echo -e "${Purple}Hello Color Change Test${NC}"
echo -e "${Cyan}Hello Color Change Test${NC}"
echo -e "${White}Hello Color Change Test${NC}"


echo -e "\e[0;31mHello Color Change Test"
echo -e "\e[0;31mHello Color Change Test"
echo -e "\e[0;31mHello Color Change Test"
echo -e "\e[0;31mHello Color Change Test"
echo -e "${Red}Hello Color Change Test"
echo -e "${Purple}Hello Color Change Test"
echo -e "${Cyan}Hello Color Change Test"
echo -e "${White}Hello Color Change Test"
