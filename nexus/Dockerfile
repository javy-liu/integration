
# Pull base image.
FROM dockerfile/java:oracle-java8

MAINTAINER lzy7750015@gmail.com

ENV NEXUS_HOME /usr/local/nexus
ENV NEXUS_WEB_CONTEXT /nexus

RUN \
  wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-2.10.0-02-bundle.tar.gz && \
  tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /usr/local && \
  useradd --user-group --system nexus && \
  chown -R nexus:nexus /usr/local/nexus-* /usr/local/sonatype-work && \
  ln -s /usr/local/nexus-* /usr/local/nexus
  

VOLUME ["/usr/local/nexus", "/usr/local/sonatype-work"]

USER nexus

WORKDIR /usr/local/nexus

# Add start script 
ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Define default command.
CMD /usr/local/bin/start.sh

EXPOSE 8081