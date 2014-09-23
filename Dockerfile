#
# intergration
#
# https://github.com/excalibur/intergration
#

# Pull base image.
FROM dockerfile/ubuntu

MAINTAINER lzy7750015@gmail.com

# Set environment variables.
ENV HOME /root
ENV CATALINA_HOME /next/tomcat

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y oracle-java8-installer nginx python-setuptools && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /next/redis && \
  cp -f *.conf /next/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /next/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /next/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/next\/redis\/data/' /next/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /next/redis/redis.conf

# Install MySQL.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  mkdir -p /next/mysql/ && \
  mv /etc/mysql/my.cnf /next/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

RUN \
  cd /tmp && \
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.12/bin/apache-tomcat-8.0.12.tar.gz && \
tar xvzf apache-tomcat-8.0.12.tar.gz && \
rm apache-tomcat-8.0.12.tar.gz && \
mv apache-tomcat-8.0.12 ${CATALINA_HOME}
 
# Config Nginx.
RUN \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  sed -i 's/\/etc\/nginx\/sites-enabled/\/next\/nginx\/sites-enabled/g' /etc/nginx/nginx.conf && \
  mkdir -p /next/nginx && \
  cp /etc/nginx/nginx.conf /next/nginx/nginx.conf && \
  cp -ar /etc/nginx/sites-enabled/ /next/nginx/ && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/next", "/etc/mysql", "/var/lib/mysql", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/start.sh"]

# Expose ports.
EXPOSE 80
EXPOSE 443