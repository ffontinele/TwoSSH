#!/bin/bash

NUMBER=$(ps -x | grep -c "python")
if [ $NUMBER = "3" ]; then
    echo "" > /dev/null
else
    nohup python /bin/proxy80.py > /bin/proxy80.txt &
    nohup python /bin/proxy433.py > /bin/proxy443.txt &
fi
   
   
   
