# sonar

docker打包的sonar环境

# 运行方式

依赖与一个外部mysql

	docker run -d --name sonar-mysql -e MYSQL_ROOT_PASSWORD=root mysql

需要初始化这个数据库

	docker run -it --link sonar-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" -e"CREATE DATABASES sonar;GRANT ALL PRIVILEGES ON sonar.* TO \"sonar\"@\"%\" IDENTIFIED BY \"sonar\";"'

然后运行sonar

	docker run -d --name sonar --link sonar-mysql:mysql -e SONAR_WEB_CONTEXT=/sonar sonar