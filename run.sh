#!/usr/bin/env bash

# stop minecraft server graceful
stop_minecraft() {
    echo "stop minecraft server"
    screen -S minecraft -p 0 -X stuff "/stop^M"
    while kill -0 $1 > /dev/null 2>&1
    do
        sleep 1
    done
}

# start minecraft server in a screen session
screen -AmDS minecraft java -Xmx4096m -Xms1024m -jar ./server.jar nogui &
pid="$!"

# trap SIGTERM and stop minecraft server
trap "stop_minecraft ${pid}" SIGTERM

# wait until all process have teminated
wait
