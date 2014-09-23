# 集成环境

环境中包括Redis、Mysql、Tomcat、Nginx。

### 启动运行

使用默认方式启动

	docker run -d -p 80:80 excalibur/integration

环境配置都位于next目录之下，如果你需要放入host主机，你可以指定该目录：

	docker run -d -p 80:80 -v /next:/next excalibur/integration

> 注意：因为是多个环境，运行的时候涉及多个角色，文件目录权限需要完整。

mysql和redis的缓存目录是`/data`，如果你要缓存host主机：

	docker run -d -p 80:80 -v /next:/next -v /data:/data excalibur/integration

nginx日志默认放在`/var/log/nginx`，如果需要放入host主机:

	docker run -d -p 80:80 -v /next:/next -v /data:/data -v /var/log/nginx:/var/log/nginx excalibur/integration

### Redis配置

Redis采用默认方式运行，如果你需要配置，对应修改redist的配置就可以了。文件路径`/next/redis/redis.conf`。

### Mysql配置

Mysql默认是只有root用户，它开启了所有权限，并且密码为空，如果你想新建库或者配置密码。使用如下命令进行:



### Tomcat配置

Tomcat完整的文件都在`/next/tomcat`

### Nginx配置

配置虚拟主机就行，配置路径`/next/nginx`