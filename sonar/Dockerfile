
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com

ENV SONAR_JDBC_URL "jdbc:mysql://db:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true"

ENV SONAR_USER "sonar"
ENV SONAR_PASSWORD "sonar"
ENV SONAR_LOG_LEVEL DEBUG

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y unzip wget && \
  cd /tmp && \
  wget http://dist.sonar.codehaus.org/sonarqube-4.5.zip && \
  
  rm -rf /var/lib/apt/lists/*

# Define default command.
CMD /usr/sbin/sshd -D

# Expose ports.
EXPOSE 22