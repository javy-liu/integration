# jenkins

docker打包的jenkins环境，主要增加了常用插件。

# 运行方式

同[jenkins](https://github.com/cloudbees/jenkins-ci.org-docker)

# 包括插件

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
 * swarm.hpi
 * envinject.hpi
 * parameterized-trigger.hpi
 * build-name-setter.hpi
 * publish-over-ssh.hpi
 * deploy.hpi
 * disk-usage.hpi 这个插件可以监控每次build项目所花费的物理空间 
 * thinBackup.hpi 这个插件可以备份你job的配置  
 * email-ext.hpi 这个插件提供你发送HTML格式的邮件
 * sidebar-link.hpi 连接别的网站地址


安装插件

wget --no-check-certificate http://updates.jenkins-ci.org/latest/cobertura.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/hipchat.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/greenballs.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/instant-messaging.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/ircbot.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/postbuild-task.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/copy-to-slave.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-credentials.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-agent.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/git-client.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/git.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/github.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-api.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-oauth.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/ghprb.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/scm-api.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/swarm.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/envinject.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/token-macro.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/build-name-setter.hpi && \	
wget --no-check-certificate http://updates.jenkins-ci.org/latest/disk-usage.hpi && \	
wget --no-check-certificate http://updates.jenkins-ci.org/latest/thinBackup.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/email-ext.hpi && \
wget --no-check-certificate http://updates.jenkins-ci.org/latest/sidebar-link.hpi