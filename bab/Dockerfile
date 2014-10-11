#
# integration
#
# https://github.com/excalibur/integration
#

# Pull base image.
FROM excalibur/integration

MAINTAINER lzy7750015@gmail.com

# config redis

# config mysql
RUN \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

# config tomcat
RUN \
  rm -rf /usr/local/apache-tomcat-8.0.12/webapps/**

# config nginx.

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

CMD /start.sh