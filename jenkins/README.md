# Jenkins

Jenkins 作为一个持续集成工具，Jenkins以开源，强大的插件而流行。

# Jenkins 安装

默认使用了docker的方式打包了Jenkins最新版安装，安装及使用都很方便。默认安装了以下插件：

 * hipchat.hpi
 * greenballs.hpi
 * credentials.hpi
 * ssh-credentials.hpi
 * ssh-agent.hpi
 * git-client.hpi
 * git.hpi
 * github.hpi
 * github-api.hpi
 * ghprb.hpi
 * github-oauth.hpi
 * scm-api.hpi
 * postbuild-task.hpi

### 使用

	docker run -d -t excalibur/jenkins
	
### 或者自定义构建
	
	docker build -t fightteam/jenkins github.com/excalibur/jenkins

### 或者简单的获取镜像

	docker pull excalibur/jenkins

