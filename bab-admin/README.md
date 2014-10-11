# bab-admin例子

首先运行bab-admin基础容器

	docker run -d -p 80:80 --name bab-admin excalibur/integration

然后查看该容器的ip
	
	$ docker inspect <containerId>

找到`IPAddress`，使用ssh进入,密码root

	ssh root@<IPAddress>

免密码登陆:

	$ ssh-keygen -t rsa 
	$ ssh-copy-id -i ~/.ssh/id_rsa.pub root@<IPAddress>

### 设置redis

redis使用了默认安装方式，需要配置进入`/etc/redis/redis.conf`配置，然后重启容器就可以了。

### 设置mysql

mysql也是默认安装，如果设置密码可以使用（初始密码为空）:

	mysqladmin -uroot -p password

### 设置tomcat

tomcat安装路径`/usr/local/tomcat`

### 设置nginx

设置nginx配置路径`/etc/nginx/`

