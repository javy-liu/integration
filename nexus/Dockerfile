
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
  apt-get install -y oracle-java8-installer wget && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN \
  wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-2.10.0-02-bundle.tar.gz && \
  tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /usr/local && \
  useradd --user-group --system nexus && \
  chown -R nexus:nexus /usr/local/nexus-* /usr/local/sonatype-work && \
  ln -s /usr/local/nexus-* /usr/local/nexus

USER nexus

VOLUME ["/usr/local/nexus", "/usr/local/sonatype-work"]

CMD /usr/local/nexus/bin/nexus console

EXPOSE 8081