
# Pull base image.
FROM jenkins:weekly

MAINTAINER lzy7750015@gmail.com

#install plugins
RUN \
	cd $JENKINS_HOME/plugins
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
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/build-name-setter.hpi 	


EXPOSE 8080

