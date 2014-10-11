# bab环境例子

环境中包括Redis、Mysql、Tomcat、Nginx、ssh。

### 启动运行

使用默认方式启动

	docker run -d -p 80:80 nebula/bab

> 注意：因为是多个环境，运行的时候涉及多个角色，文件目录权限需要完整。

如果启动shell：

	docker run -it --rm --link <别名>:<别名> nebula/bab bash