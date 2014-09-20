#
# nebula Dockerfile
#

FROM dockerfile/ubuntu

MAINTAINER lzy7750015@gmail.com

# Set environment variables.
ENV HOME /root
ENV CATALINA_HOME /usr/local/tomcat

# Upadte base image
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y python-setuptools oracle-java8-installer nginx mysql-server && \
  rm -rf /var/lib/apt/lists/*

# Install Redis.
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

# Define mountable directories.
VOLUME ["/data"]

# Config Nginx.
RUN \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Install MySQL.
RUN \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf
  
# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Install Tomcat
RUN \
  	cd /tmp && \
	wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.12/bin/apache-tomcat-8.0.12.tar.gz && \
	tar xvzf apache-tomcat-8.0.12.tar.gz && \
	rm apache-tomcat-8.0.12.tar.gz && \
	mv apache-tomcat-8.0.12 ${CATALINA_HOME} && \
	rm -rf /usr/local/tomcat/webapps/*

VOLUME ["/usr/local/tomcat/webapps"]

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Initialization and Startup Script
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["/start.sh"]
