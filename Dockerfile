#
# intergration
#
# https://github.com/excalibur/intergration
#

# Pull base image.
FROM ubuntu:14.10

MAINTAINER lzy7750015@gmail.com

# Set environment variables.
ENV HOME /root
ENV CATALINA_HOME /usr/local/tomcat

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  add-apt-repository -y ppa:nginx/stable && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y python-setuptools oracle-java8-installer nginx mysql-server && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# Install MySQL.
RUN \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf

RUN \
  cd /tmp && \
	wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.12/bin/apache-tomcat-8.0.12.tar.gz && \
	tar xvzf apache-tomcat-8.0.12.tar.gz && \
	rm apache-tomcat-8.0.12.tar.gz && \
	mv apache-tomcat-8.0.12 ${CATALINA_HOME}
 
# Config Nginx.
RUN \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/mysql", "/var/lib/mysql", "/usr/local/tomcat/webapps", "/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["start.sh"]