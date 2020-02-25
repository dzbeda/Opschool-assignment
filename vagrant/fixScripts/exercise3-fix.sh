#!/bin/bash
sudo sed -i ':a;N;$!ba;s/deny from all/allow from all/1' /etc/apache2/sites-available/default
sudo service apache2 restart
