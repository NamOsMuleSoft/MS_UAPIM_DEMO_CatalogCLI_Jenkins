FROM jenkins/jenkins:latest

USER root

RUN apt-get update && apt-get install -y lsb-release && apt-get install -y npm

RUN apt-get install -y mlocate && apt-get install bash-completion -y

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

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli --plugins -f /usr/share/jenkins/ref/plugins.txt

RUN curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh

COPY casc.yaml /var/jenkins_home/casc.yaml

#declare pipelines
COPY createPipelines.groovy /usr/local/createPipelines.groovy

#createFlex

COPY demos/createFlex/pipeline.jenkins /var/jenkins_home/demos/createFlex/pipeline.jenkins
COPY demos/createFlex/pipeline.jenkins /var/jenkins_home/demos/createFlex/job.jenkins

#autoCatalog

COPY demos/autoCatalog/pipeline.jenkins /var/jenkins_home/demos/autoCatalog/pipeline.jenkins

#autoProxy

COPY demos/autoProxy/pipeline.jenkins /var/jenkins_home/demos/autoProxy/pipeline.jenkins
COPY demos/autoProxy/policies.json /var/jenkins_home/demos/autoProxy/policies.json
COPY demos/autoProxy/HelloCICD.json /var/jenkins_home/demos/autoProxy/HelloCICD.json






