#!/bin/bash
#   Slick Progress Bar
#   Created by: Ian Brown (ijbrown@hotmail.com)
#   Please share with me your modifications
# Note: From http://stackoverflow.com/questions/11592583/bash-progress-bar
# Functions
sudo apt-get -qq install bc
PUT(){ echo -en "\033[${1};${2}H";}  
DRAW(){ echo -en "\033%";echo -en "\033(0";}         
WRITE(){ echo -en "\033(B";}  
HIDECURSOR(){ echo -en "\033[?25l";} 
NORM(){ echo -en "\033[?12l\033[?25h";}
function showBar {
        percDone=$(echo 'scale=2;'$1/$2*100 | bc)
        halfDone=$(echo $percDone/2 | bc) #I prefer a half sized bar graph
        barLen=$(echo ${percDone%'.00'})
        halfDone=`expr $halfDone + 6`
        tput bold
        PUT 7 28; printf "%4.4s  " $barLen%     #Print the percentage
        for (( i=6 ; i<=$halfDone ; i++ ))
        do
          PUT 5 $i;  echo -e "\033[7m \033[0m" #Draw the bar
        done
        PUT 8 1; echo -e "Elapsed time: $(($currenttime-$starttime)) seconds"
        PUT 9 1; echo -e "Total: $2"
        PUT 10 1; echo -e "Done: $1"
        tput sgr0
        }
# Start Script
starttime=$(date +%s);
currenttime=$(date +%s);
clear
HIDECURSOR
echo -e ""                                           
echo -e ""                                          
DRAW    #magic starts here - must use caps in draw mode                                        
echo -e "       PLEASE WAIT WHILE KLOUDBOY SCRIPT IS IN PROGRESS"
echo -e "    lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk"  
echo -e "    x                                                   x" 
echo -e "    mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj"
WRITE             
#
sudo apt-get -qq install nginx pwgen zip unzip php7.2-fpm php7.2-curl php7.2-gd php7.2-imap php7.2-readline php7.2-common php7.2-recode php7.2-mysql php7.2-cli php7.2-curl php7.2-mbstring php7.2-bcmath php7.2-mysql php7.2-opcache php7.2-zip php7.2-xml php-memcached php-imagick php-memcache memcached graphviz php-pear php-xdebug php-msgpack php7.2-soap mariadb-server mariadb-client php7.2-mysql > /dev/null
# Insert your script here
for (( i=0; i<=50; i++ ))  
do
    showBar $i 46  #Call bar drawing function "showBar"
    sleep .2
done
# End of your script
# Clean up at end of script
PUT 10 12                                           
echo -e ""
echo -e "Installation & configuration succesfully finished.
Twitter: @TeamKloudboy
e-mail: support@kloudboy.com
Bye!"                                        
NORM
