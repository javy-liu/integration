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
  mkdir /next && \
  chmod 777 /next

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
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable*
  

# Install MySQL.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf
  

RUN \
  cd /tmp && \
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.12/bin/apache-tomcat-8.0.12.tar.gz && \
tar xvzf apache-tomcat-8.0.12.tar.gz && \
rm apache-tomcat-8.0.12.tar.gz && \
mv apache-tomcat-8.0.12 /usr/local/
 
# Config Nginx.
RUN \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  sed -i 's/\/etc\/nginx\/sites-enabled/\/next\/nginx\/sites-enabled/g' /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN \
  apt-get update && \
  apt-get install -y openssh-server && \
  mkdir /var/run/sshd && \
  echo 'root:root' |chpasswd && \
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# Define mountable directories.
VOLUME ["/data", "/etc/mysql", "/var/lib/mysql", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Define working directory.
WORKDIR /root

# Define default command.
CMD /usr/local/bin/supervisord -n

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 22