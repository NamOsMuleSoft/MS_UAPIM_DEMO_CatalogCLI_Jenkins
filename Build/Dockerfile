FROM jenkins/jenkins:2.414.2-jdk17
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml

USER root
RUN apt-get update && apt-get install -y lsb-release && apt-get install -y npm
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN npm install -g anypoint-cli-v4 && \
    anypoint-cli-v4 plugins:install anypoint-cli-account-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-api-mgr-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-cloudhub-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-designcenter-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-exchange-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-governance-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-runtime-mgr-plugin && \
    anypoint-cli-v4 plugins:install anypoint-cli-datagraph-plugin && \
    npm install -g api-catalog-cli@latest

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"