#!/bin/bash
readonly SERVERS="server1 server2 server3"
for server in ${SERVERS};   do 
        echo "${server}.ramil.com" 
done
echo "That's it"


case $1 in
    1) 
        echo "fool" ;;
    2) 
        echo "imbecil" ;;
    3)
        echo "attaboy" ;;
    *)
        echo "You have chosen $1 yourself. $2" ;;
esac