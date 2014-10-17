
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com

RUN \
  wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-2.10.0-02-bundle.tar.gz && \
  tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /usr/local && \
  useradd --user-group --system nexus && \
  chown -R nexus:nexus /usr/local/nexus-* /usr/local/sonatype-work && \
  ln -s /usr/local/nexus-* /usr/local/nexus

VOLUME ["/usr/local/nexus", "/usr/local/sonatype-work"]

CMD /usr/local/nexus/bin/nexus console

EXPOSE 8081