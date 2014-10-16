
# Pull base image.
FROM excalibur/ubuntu

MAINTAINER lzy7750015@gmail.com

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y openssh-server && \
  mkdir -p /var/run/sshd && \
  echo 'root:root' |chpasswd && \
  rm -rf /var/lib/apt/lists/*

# Define default command.
CMD /usr/sbin/sshd -D

# Expose ports.
EXPOSE 22