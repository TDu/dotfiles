#!/bin/bash
function docodb {
    if [ "$1" ]
        then
            docker ps --format "table {{.Names}}\t{{.Ports}}" | grep $1.*db | awk -F'[:-]' '{print $2}'
            return
    fi
    echo "No arguments or not specific enough so return a list of db and ports..."

}
