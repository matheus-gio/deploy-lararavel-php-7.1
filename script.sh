apt-get update -y
apt-get install apache2 -y

systemctl start apache2
systemctl enable apache2

add-apt-repository ppa:ondrej/php
apt-get update -y

apt install -y php7.1 php7.1-xml php7.1-mbstring php7.1-mysql php7.1-json php7.1-curl php7.1-cli php7.1-common php7.1-mcrypt php7.1-gd libapache2-mod-php7.1 php7.1-zip

cd ~
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
