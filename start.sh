#!/bin/bash
#
# author: excalibur
# emial:lzy7750015@gmail.com
# 


# 
if [ ! -f /var/www/sites/setting.conf ]; then
	# Config Mysql
	NEBULA_DB="nebula"
    MYSQL_PASSWORD="root"
    DRUPAL_PASSWORD="nebula"
    echo "mysqld_safe &" > /tmp/config && \
    echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
    echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
	echo "mysqladmin -u root password $MYSQL_PASSWORD" >> /tmp/config && \
	echo "mysql -uroot -p$MYSQL_PASSWORD -e \"CREATE DATABASE ${NEBULA_DB}; \
GRANT ALL PRIVILEGES ON ${NEBULA_DB}.* TO '${NEBULA_DB}'@'localhost' IDENTIFIED BY '$DRUPAL_PASSWORD'; \
FLUSH PRIVILEGES;\""  >> /tmp/config && \
	bash /tmp/config && \
	rm -f /tmp/config 


    # Set Jndi
    #sed -i 's/^\(log_error\s.*\)/# \1/' /src/mysql/my.cnf

    pkill -9 mysqld
fi


# start all the services
/usr/local/bin/supervisord -n