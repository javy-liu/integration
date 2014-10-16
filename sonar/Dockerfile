
# Pull base image.
FROM ubuntu:14.04

MAINTAINER lzy7750015@gmail.com

# Install Java.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer wget unzip && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

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