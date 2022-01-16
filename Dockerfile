FROM jenkins/jenkins:lts
LABEL maintainer="jack" 

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

ENV JENKINS_HOME /var/jenkins_home
ENV TZ Asia/Shanghai
COPY hudson.model.UpdateCenter.xml /var/jenkins_home/
COPY default.json updates/default.json

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
