#!/bin/bash
#####################################################################
# Author: Rahul Sharma <rahuls@ccs.neu.edu>                         #
#                                                                   #
# Script to remove all container entries from docker-daemon.        #
# It removes running as well as terminated containers.              #
#                                                                   #
#####################################################################

containers=($(docker ps -a | awk -F' ' '{print $1}'))

# skip the first element as it is 'CONTAINER'
for container in "${containers[@]:1}"
do
    docker rm $container
done

echo "All containers removed"
