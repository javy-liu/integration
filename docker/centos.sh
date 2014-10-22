sudo wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker && \
sudo chmod +x /usr/bin/docker && \
sudo wget --no-check-certificate https://github.com/docker/docker/raw/master/contrib/init/systemd/docker.service -O /etc/systemd/system/docker.service && \
sudo wget --no-check-certificate https://github.com/docker/docker/raw/master/contrib/init/systemd/docker.socket -O /etc/systemd/system/docker.socket && \
systemctl enable /etc/systemd/system/docker.service