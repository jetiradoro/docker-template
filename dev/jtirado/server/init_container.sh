#!/bin/bash

#windows compatibility
cat /scripts/.bashrc >> /root/.bashrc
dos2unix ~/.bashrc

#init cron
crontab -u www-data /scripts/cron_laravel.txt
service cron start

cd /app

# init apache
apache2ctl -D FOREGROUND