#! /bin/bash

#Check if a service is active

##################################################
##  This script is to practice different things ##                                            
##   AUTHOR: Ramil Safin                        ##                   
##################################################
yellow='\033[0;33m'
print_color(){
NC='\e[0m'

case $1 in
    "green") COLOR='\033[0;32m' ;;
    "red") COLOR='\033[0;31m' ;;
    "yellow") COLOR='\033[0;33m' ;;
    "*") COLOR='\033[0m' ;;
esac

echo -e "${COLOR} $2 ${NC}"

}

check_service_status(){
    read -p "Enter the name of the service: " service_name
    print_color "yellow" "Checking the status of the service..."
    sleep 1

    case $(systemctl is-active "$service_name") in
    active)
        print_color "green" "The service "$service_name" is active";;
    inactive)
        print_color "red" "The service "$service_name" is not active" 
       read -p "Do you want to start the service ${service_name} ? Y/N" start_service
       if [[ "$start_service" == "Y" ]]; then
            sudo systemctl start ${service_name} 
            echo "Service ${service_name} started"
        else
            echo "Service not started"
       fi ;;
    esac
        }
        

check_service_status ${service_name}
