# CI文档

本仓库要解决是是CI问题。我主要用一下方式来完成。

使用phabricator来完成内网git仓库host，以及代码review等。

使用jenkins来完成持续集成，方便构建。

使用docker来封装环境，进行打包。


### docker安装

docker安装最好是使用官方二进制进行安装(最好使用最新版本，低版本会有不少bug和缺失功能)。注意内核需要大于3.8(最好是3.10，bug比较少)

ubuntu二进制安装很简单，键入如下命令就可以：

	$ curl -sSL https://get.docker.com/ubuntu/ | sudo sh

centos二进制安装

	$ sudo wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker
	$ sudo chmod +x /usr/bin/docker

这样就可以使用了，但是管理还是比较麻烦，我们需要把docker安装成service。

	$ sudo wget --no-check-certificate https://github.com/docker/docker/raw/master/contrib/init/systemd/docker.service -O /etc/systemd/system/docker.service
	$ sudo wget --no-check-certificate https://github.com/docker/docker/raw/master/contrib/init/systemd/docker.socket -O /etc/systemd/system/docker.socket
	$ sudo systemctl enable /etc/systemd/system/docker.service

启动docker就行了：

	$ sudo service docker start 

#### 二进制更新

更新方式和安装是一样的，不过得先停掉所有docker线程：

	$ killall docker

### 内部镜像仓库

待完成...

### 镜像与容器

到现在docker安装好了可以直接启动使用了。通常我们需启动一个容器来运行我们的程序，比如nginx:

	$ docker run -d -p 80:80 --name nginx nginx

> 小技巧：通常中我们需要在运行中挂载一点别的资源，或者构建一点别的工具，但是一个linux镜像通常有300M—400M，很占硬盘空间。怎么解决呢？可以使用busybox镜像来代替，它很小，只有2.5M。

### 关于网络，以及容器之间连接

默认情况下，Docker 会将所有容器连接到由 docker0 提供的虚拟子网中。默认容器ip是一个桥接的内部网络172.17.X.X/16。主机上的容器是可以相互连接的。每个容器启动会被自动分配一个ip。

> 小技巧：在使用容器连接的时候相互连接虽然是可以连接的，但是通常没有什么用。为什么呢？因为每次重启容器ip都会更新，所以互联配置连接容器ip也就失效了。所以容器网络之间隔离开来是比较好的。那需要连接了怎么办？使用`--link`来完成。这样就不用怕ip的更新了。

### jenkins 安装运行

运行在根路径

	$ docker run -d --name jenkins -v /var/jenkins_home:/var/jenkins_home jenkins:weekly

或者运行在指定路径

	$ docker run -d --name jenkins -v /var/jenkins_home:/var/jenkins_home --JENKINS_PREFIX=/jenkins jenkins:weekly

### sonar 安装运行

sonar 需要一个数据库

	$ docker run -d --name sonar-mysql -e MYSQL_ROOT_PASSWORD=root mysql

初始化这个数据库

	$ docker run -it --link sonar-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" -e"CREATE DATABASE sonar;GRANT ALL PRIVILEGES ON sonar.* TO \"sonar\"@\"%\" IDENTIFIED BY \"sonar\";"'

运行sonar

	$ docker run -d --name sonar --link sonar-mysql:mysql sonar

### nginx安装运行

	$ docker run -d -p 80:80 -p 443:443 --name nginx --link jenkins:jenkins --link sonar:sonar dockerfile/nginx

### 工具

- shadowsocks
- nginx
- mysql
- tomcat
- jenkins
- nexus
- phabricator
- sonar