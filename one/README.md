# 集成环境

环境中包括Redis、Mysql、Tomcat、Nginx、ssh。

### 启动运行

使用默认方式启动

	docker run -d -p 80:80 excalibur/integration

> 注意：因为是多个环境，运行的时候涉及多个角色，文件目录权限需要完整。

redis的缓存目录是`/data`，如果你要缓存host主机：

	docker run -d -p 80:80 -v <data-dir>:/data excalibur/integration

nginx日志默认放在`/var/log/nginx`，如果需要放入host主机:

	docker run -d -p 80:80 -v <log-dir>:/var/log/nginx excalibur/integration

这只是这几种软件的基本配置环境，如果你需要配置请对应设置。
