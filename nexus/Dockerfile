
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com

ENV NEXUS_HOME /usr/local/nexus
ENV NEXUS_WEB_CONTEXT /nexus

RUN \
  wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-2.10.0-02-bundle.tar.gz && \
  tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /usr/local && \
  ln -s /usr/local/nexus-* /usr/local/nexus
  sed -i 's/^\(nexus-webapp-context-path\)=\(\\nexus\S*\)/\1=${env:NEXUS_WEB_CONTEXT}/' /usr/local/nexus/conf/nexus.properties

VOLUME ["/usr/local/nexus", "/usr/local/sonatype-work"]

WORKDIR /usr/local/nexus

CMD /usr/local/nexus/bin/nexus console

EXPOSE 8081