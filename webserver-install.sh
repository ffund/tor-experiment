sudo apt-get update
sudo apt-get -y install apache2 php5 libapache2-mod-php5 vim

sudo rm /var/www/html/index.html
echo '<?php' | sudo tee -a /var/www/html/index.php
echo 'echo "Remote address: " . $_SERVER['REMOTE_ADDR'] . "\n";' | sudo tee -a /var/www/html/index.php
echo 'echo "Forwarded for:  " . $_SERVER['HTTP_X_FORWARDED_FOR'] . "\n";' | sudo tee -a /var/www/html/index.php
echo '?>' | sudo tee -a /var/www/html/index.php

sudo /etc/init.d/apache2 restart


sudo wget --no-clobber http://witestlab.poly.edu/repos/genimooc/dash_video/BigBuckBunny_2s_480p_only.tar.gz --output-document /var/www/html/BigBuckBunny_2s_480p_only.tar.gz
cd /var/www/html; sudo tar -zxvf BigBuckBunny_2s_480p_only.tar.gz  

cd /var/www/html/video; sudo rm /var/www/html/video/bunny_Desktop.mpd  
wget --no-clobber -nH --no-parent "https://raw.githubusercontent.com/ffund/tor-experiment/master/bunny_Desktop.mpd"  --output-document /var/www/html/video/bunny_Desktop.mpd

