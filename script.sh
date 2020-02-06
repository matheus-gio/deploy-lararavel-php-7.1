apt-get update -y
apt-get install apache2 -y

systemctl start apache2
systemctl enable apache2
a2enmod rewrite
systemctl restart apache2

add-apt-repository ppa:ondrej/php
apt-get update -y

apt install -y php7.1 php7.1-xml php7.1-mbstring php7.1-mysql php7.1-json php7.1-curl php7.1-cli php7.1-common php7.1-mcrypt php7.1-gd libapache2-mod-php7.1 php7.1-zip

cd ~
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer


cp 000-default.conf /etc/apache2/sites-available/000-default.conf

iptables -F
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -j DROP
