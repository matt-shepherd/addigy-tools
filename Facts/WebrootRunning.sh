#!/bin/bash

RUNNING_PROCESSES="$(ps aux | grep 'WFDaemon\|WSDaemon' | grep -v grep | wc -l | xargs)"
if (( $RUNNING_PROCESSES == 2)); then 
    echo 'true';
else
    echo 'false';
fi