
# Pull base image.
FROM mysql

MAINTAINER lzy7750015@gmail.com

# init sql
RUN \
  echo "mysqld --datadir=/var/lib/mysql --user=mysql &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -uroot -p$MYSQL_ROOT_PASSWORD -e 'GRANT ALL PRIVILEGES ON sonar.* TO \"sonar\"@\"%\" identified by \"sonar\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config



