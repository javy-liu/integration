
# Pull base image.
FROM dockerfile/ubuntu

MAINTAINER lzy7750015@gmail.com

# Set environment variables.
ENV SS_SERVER 0.0.0.0
ENV SS_PORT 8388
ENV SS_LOCAL_ADDRESS 127.0.0.1
ENV SS_LOCAL_PORT 1080
ENV SS_PASSWORD 123456
ENV SS_TIMEOUT 300
ENV SS_METHOD aes-256-cfb
ENV SS_FAST_OPEN false
ENV SS_WORKERS 1

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python-pip python-setuptools && \
  pip install shadowsocks && \
  rm -rf /var/lib/apt/lists/*

# Supervisor Config
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

# Add start script 
ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Define default command.
CMD /usr/local/bin/start.sh
