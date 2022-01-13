#!/bin/bash



#windows compatibility
cat /scripts/.bashrc >> /home/innovait/.bashrc
dos2unix /home/innovait/.bashrc

# init cron
echo "secret" | sudo -S crontab -u www-data /scripts/cron_laravel.txt
echo "secret" | sudo -S service cron start

cd /app

# init apache
echo "secret" | sudo -S apache2ctl -D FOREGROUND