
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com

ENV SONAR_JDBC_URL jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true
ENV SONAR_USER sonar
ENV SONAR_PASSWORD sonar
ENV SONAR_LOG_LEVEL DEBUG
ENV	SONAR_WEB_CONTEXT /
ENV SONAR_HOME /usr/local/nexus

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python-pip python-setuptools && \
  rm -rf /var/lib/apt/lists/*

# Install Mysql.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" IDENTIFIED BY \"root\" WITH GRANT OPTION;CREATE DATABASE sonar;GRANT ALL PRIVILEGES ON sonar.* TO \"sonar\"@\"%\" IDENTIFIED BY \"sonar\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

# Install Sonar.
RUN \
  wget -O /tmp/sonar-latest.zip http://dist.sonar.codehaus.org/sonarqube-4.5.zip && \
  unzip /tmp/sonar-latest.zip -d /usr/local && \
  ln -s /usr/local/sonarqube-* /usr/local/sonar && \
  rm -rf /tmp/sonar-latest.zip && \
  sed -i 's/^#\(sonar.jdbc.url\)=\(jdbc:mysql:\S*\)/\1=${env:SONAR_JDBC_URL}\n#\1=\2/' /usr/local/sonar/conf/sonar.properties && \
  sed -i 's/^#\(sonar.jdbc.username\)=sonar/\1=${env:SONAR_USER}/' /usr/local/sonar/conf/sonar.properties && \
  sed -i 's/^#\(sonar.jdbc.password\)=sonar/\1=${env:SONAR_PASSWORD}/' /usr/local/sonar/conf/sonar.properties && \
  sed -i 's/^#\(sonar.web.context\)=/\1=${env:SONAR_WEB_CONTEXT}/' /usr/local/sonar/conf/sonar.properties

VOLUME ["/usr/local/sonar", "/etc/mysql", "/var/lib/mysql"]

WORKDIR /usr/local/sonar

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Define default command.
CMD /usr/local/bin/supervisord -n

EXPOSE 9000
EXPOSE 3306
