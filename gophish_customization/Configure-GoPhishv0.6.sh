#!/bin/bash
sudo yum install postfix -y
sudo mkdir /usr/share/gophish-v0.6.0/
sudo mkdir /var/log/gophish-v0.6.0/
sudo aws s3 cp --recursive s3://software-share-913373464384/gophish-v0.6.0-linux-64bit/ /usr/share/gophish-v0.6.0/
chmod +x /usr/share/gophish-v0.6.0/gophish
sudo cp /usr/share/gophish-v0.6.0/scripts/gophish  /etc/init.d/
sudo chmod +x /etc/init.d/gophish
sudo chkconfig --add gophish
sudo chkconfig --levels 2345 gophish on
#edit main.cf file and change line #mynetworks_style = host to mynetworks_style = host
sudo sed -i "s/^#mynetworks_style = host/mynetworks_style = host/g" /etc/postfix/main.cf
sudo sed -i "s/^#relayhost = $mydomain/relayhost = $mydomain/g" /etc/postfix/main.cf
sudo reboot now
