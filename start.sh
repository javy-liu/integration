#!/bin/bash
#
# author: excalibur
# emial:lzy7750015@gmail.com
# 


# if setting.conf isn't exist, create Defaut config
# if [ ! -f /next/setting.conf ]; then
#     echo "start" > /next/setting.conf
#     echo "running" >> /next/setting.conf
# fi


# start all the services
/usr/local/bin/supervisord -n