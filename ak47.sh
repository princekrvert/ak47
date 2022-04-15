#!/usr/bin/bash 
# made by prince kumar 
#date 26 mar 2022
# make a main option choosing manue 
# make a variable and store the pwd
trap exitout SIGINT
trap exitout SIGTSTP
req(){
    printf "${r}_______ ${p} checking for requirements ${r}_______\n"
	command -v curl 2>&1 > /dev/null || { echo -e  "${g}+++++${y}Installing curl${g}+++++" ; apt-get install curl -y ; }
    command -v unzip 2>&1 > /dev/null || { echo -e "${g}+++++${y}Installing unzip${g}+++++" ; apt-get install unzip -y ;}
	command -v wget 2>&1 > /dev/null || { echo -e "${g}+++++${y}Installing wget${g}+++++" ; apt-get install wget -y ; }
    clear
}
req
banner(){
    echo -e "\033[35;1m ︻╦╤─\033[36;1m MADE BY PRINCE "
    echo -e " \033[0;1m"
}
banner
# make a function to install the tools 
install(){
    currentdir=$(pwd)
url=$(awk '{print NR,$0}' tools/$1 | grep "$2" | awk '{print $4}')
cd ~
git clone ${url}
cd $currentdir
bash ak47.sh
}
#make a function to show all the tools 
# information gathering function 
showme(){
    #first check for file
    if [ -f "tools/${1}" ];then
    n=$(wc -l tools/${1} | awk '{print $1}')
    i=1
    while read -r line;do
    t_name=$(echo "$line" | awk '{print $1}')
    printf "[%02d] %s \n" "$i" "$t_name"
    i=$((i+1))
    done < tools/${1}
    else
    echo -e "File removed. please update this tool"
    fi
    echo -ne "\e[97;1m :: "
    read ins_o
    install ${1} $ins_o

}
#function to exit this program 
exitout(){
    echo -e "\e[35;1m Exiting ak47..."
    sleep 0.9
    exit 0
}
# make a function to update the tool
updateme(){
    echo -e "\e[31;1m Checking version of the tool ...."
    version=$(curl -s https://raw.githubusercontent.com/princekrvert/ak47/main/version)
    if [[ $version=="1.0.1" ]];then
    echo "Tool is already updated.."
    else
    echo "\e[92;1m Updating ak47 "
    git pull https://github.com/princekrvert/ak47.git > /dev/null 2>&1 & echo -e "${g}[⏰${g}] ${b} wait..."
	clear
    fi
}
# make a fuchtion for about me 
aboutme(){
    echo -e "\e[32;1m My name is prince kumar"
    echo -e "\e[32;1m For latest update follow me on instagram : https://instagram.com/princekrvert "
    echo -e "\e[36;1m Thanks for using this tool "
}
# make a function to show the catogery of the tools 
catogery(){
    echo " "
    echo -e "\e[95;1m [01] Information Gathering"
    echo -e "\e[95;1m [02] Phishing "
    echo -e "\e[95;1m [03] Bruteforce Tools"
    echo -e "\e[95;1m [04] Styling "
    echo -e "\e[95;1m [05] Others "
    echo " "
echo -ne "\e[97;1m :: "
read t_optn
# now handle the user options 
if [[( $t_optn == "1") || ( $t_optn == "01")]];then 
showme info.txt
elif [[( $t_optn == "2") || ( $t_optn == "02")]];then
showme phish.txt
elif [[( $t_optn == "3") || ( $t_optn == "03")]];then
showme brute.txt
elif [[( $t_optn == "4") || ( $t_optn == "04")]];then
showme style.txt
elif [[( $t_optn == "5") || ( $t_optn == "05")]];then
showme other.txt
else
echo -e "\031;1m Invalid option.. "
fi    
}
echo -e "\e[33;1m[01] \033[32;1m Show all tools"
echo -e "\e[33;1m[02] \033[32;1m Catogery "
echo -e "\e[33;1m[03] \033[32;1m Update "
echo -e "\e[33;1m[04] \033[32;1m About me "
echo -e "\e[33;1m[05] \033[32;1m Exit "
echo " "
echo -ne "\e[97;1m :: "
read f_optn
# now handle the user options 
if [[( $f_optn == "1") || ( $f_optn == "01")]];then 
showme all.txt
elif [[( $f_optn == "2") || ( $f_optn == "02")]];then 
catogery
elif [[( $f_optn == "3") || ( $f_optn == "03")]];then 
updateme
elif [[( $f_optn == "4") || ( $f_optn == "04")]];then 
aboutme
elif [[( $f_optn == "5") || ( $f_optn == "05")]];then 
exitout
else 
echo "\033[31;1m Invalid option"
fi

