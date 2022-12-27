FROM jenkins/jenkins:lts
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common \
	&&  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
	&& add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce docker-ce-cli containerd.io -y
RUN  echo root:root | /usr/sbin/chpasswd \
	&& echo jenkins:jenkins | /usr/sbin/chpasswd
