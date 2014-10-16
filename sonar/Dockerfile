
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com


RUN \
  wget -O /tmp/sonar-latest.zip http://dist.sonar.codehaus.org/sonarqube-4.5.zip && \
  unzip /tmp/sonar-latest.zip -d /usr/local && \
  useradd --user-group --system sonar && \
  chown -R sonar:sonar /usr/local/sonarqube-* && \
  ln -s /usr/local/sonarqube-* /usr/local/sonar && \
  rm -rf /tmp/sonar-latest.zip && \
  sed -i 's/^#\(sonar.jdbc.url=jdbc:mysql:\/\/\)localhost\(:3306*\)/\1db\2/' /usr/local/sonar/conf/sonar.properties && \
  sed -i 's/^#\(sonar.jdbc.username=*\)/\1/' /usr/local/sonar/conf/sonar.properties && \
  sed -i 's/^#\(sonar.jdbc.password=*\)/\1/' /usr/local/sonar/conf/sonar.properties

USER sonar

VOLUME ["/usr/local/sonar"]

CMD ["/usr/local/sonar/bin/linux-x86-64/sonar.sh","console"]

EXPOSE 9000

