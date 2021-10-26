#! /bin/bash

interface="$1"
if [ -z "${interface}" ]; then
    interface="eth0"
fi

function log2 {
    local x=0
    for (( y=$1-1 ; $y > 0; y >>= 1 )) ; do
        let x=$x+1
    done
    echo $x
}


function copyToClipboard {
    echo $1 | tr -d '\n' | cat | xclip -selection clipboard
}
function getMAC {
    mac=$(ifconfig $interface | grep ether | sed "s/^[ \t]*//" | cut -d ' ' -f 2) 
    echo "$mac"
}

function getCIDR {
    netmask=$(ifconfig $interface | grep netmask | sed "s/^[ \t]*//" | cut -d ' ' -f 5)
    IFS='.' read -r -a octets <<< "$netmask"

    cidr=0

    for oct in "${octets[@]}"
    do
      cidr=$((cidr + $(log2 $oct+1)))
    done
    
    echo "$cidr"
}

function getIP {
    ip=$(ifconfig $interface | grep netmask |head -1 | sed "s/^[ \t]*//" | cut -d " " -f 2)
    echo "$ip"
}

interface=$1

if [ "$2" == "m" ]
then
    mac=$(getMAC)
    if [ -z $mac ]; then 
        mac="NOT AVAILABLE!"
    else
        copyToClipboard "$mac" 
    fi
    echo -e "\n\tMAC: $mac\n"
else
    ip=$(getIP)
    if [ -z $ip ]; then 
        ip="NOT AVAILABLE!"
    else 
        copyToClipboard "$ip"
    fi
    cidr=$(getCIDR)
 
    echo -e "\n\tIP: $ip/$cidr\n"
fi

