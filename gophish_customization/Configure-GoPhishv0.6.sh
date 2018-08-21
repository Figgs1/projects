#!/bin/bash
yum install postfix -y
mkdir /usr/share/gophish-v0.6.0/
mkdir /var/log/gophish-v0.6.0/
aws s3 cp --recursive s3://software-share-913373464384/gophish-v0.6.0-linux-64bit/ /usr/share/gophish-v0.6.0/
chmod +x /usr/share/gophish-v0.6.0/gophish
cp /usr/share/gophish-v0.6.0/scripts/gophish  /etc/init.d/
chmod +x /etc/init.d/gophish
chkconfig --add gophish
chkconfig --levels 2345 gophish on
#edit main.cf file and change line #mynetworks_style = host to mynetworks_style = host
sed -i "s/^#mynetworks_style = host/mynetworks_style = host/g" /etc/postfix/main.cf
sed -i "s/^#relayhost = $mydomain/relayhost = $mydomain/g" /etc/postfix/main.cf
reboot now
