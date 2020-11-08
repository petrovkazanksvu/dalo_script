#!/bin/bash
#sudo apt-get update
#apt-get install freeradius-mysql mysql-server mysql-client
#mysql --defaults-extra-file=./config_file
#!/bin/bash
#mysql -u root -pqwe123 -e "CREATE DATABASE radius4 CHARACTER SET UTF8 COLLATE UTF8_BIN;CREATE USER 'radius4'@'%' IDENTIFIED BY 'kamisama123';GRANT ALL PRIVILEGES ON radius4.* TO 'radius4'@'%';"
#updatedb
#mysql -u radius -pradius < /etc/freeradius/3.0/mods-config/sql/main/mysql/schema.sql
#ln -s /etc/freeradius/3.0/mods-available/sql  /etc/freeradius/3.0/mods-enabled/
#sed -i 's/ERROR/DEBUG/; s/loglevelerror/logleveldebug/' filename
: <<'END_COMMENT'
sed -i -e 's/driver = "rlm_sql_null"/driver = "rlm_sql_mysql"/;'`
         `'s/dialect = "sqlite"/dialect = "mysql"/;'`
         `'s/#	server = "localhost"/ 	server = "localhost"/;'`
         `'s/#	port = 3306/ 	port = 3306/;'`
         `'s/#	login = "radius"/ 	login = "radius"/;'`
         `'s/#	password = "radpass"/ 	password = "kamisama123"/;'`
         `'s/#	read_clients = yes/ 	read_clients = yes/'`
         ` /etc/freeradius/3.0/mods-enabled/sql
END_COMMENT
#service freeradius restart
#apt-get -y install apache2 php libapache2-mod-php php-mysql unzip
#apt-get -y install php-pear php-db php-mail php-gd php-common php-mail-mime
#mkdir /downloads/daloradius -p
#cd /downloads/daloradius
#wget https://github.com/lirantal/daloradius/archive/master.zip
#unzip master.zip
#mv daloradius-master /var/www/html/daloradius
#cd /var/www/html/daloradius/contrib/db/
#mysql -u radius -pkamisama123 radius < fr2-mysql-daloradius-and-freeradius.sql
#mysql -u radius -pkamisama123 radius < mysql-daloradius.sql
#sed -i -e 's/\$configValues\[\x27CONFIG_DB_PASS\x27\] = \x27\x27;/\$configValues\[\x27CONFIG_DB_PASS\x27\] = \x27kamisama123\x27;/' /var/www/html/daloradius/library/daloradius.conf.php
#chown www-data.www-data /var/www/html/daloradius/* -R
service freeradius restart
service apache2 restart
