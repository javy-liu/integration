#
# nebula Dockerfile
#

FROM dockerfile/ubuntu

MAINTAINER lzy7750015@gmail.com

# Upadte base image
RUN \
  echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list && \
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins
 
# Install plugins
RUN \
	mkdir -p /var/lib/jenkins/plugins && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/cobertura.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/hipchat.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/greenballs.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/instant-messaging.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ircbot.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/postbuild-task.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/copy-to-slave.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-credentials.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-agent.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/git-client.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/git.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/github.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-api.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-oauth.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/ghprb.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/scm-api.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/swarm.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/envinject.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/token-macro.hpi) && \
	(cd /var/lib/jenkins/plugins && wget --no-check-certificate http://updates.jenkins-ci.org/latest/build-name-setter.hpi) 

# Define working directory.
WORKDIR /root

# Define default command.
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]

# Expose ports.
EXPOSE 80
EXPOSE 443