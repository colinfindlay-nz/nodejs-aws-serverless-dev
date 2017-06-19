#https://github.com/npm/npm/issues/16766 prevents NPM5 on CircleCI for now :-(
FROM node:7.9

RUN apt-key adv --fetch-keys http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
RUN curl http://repo.mosquitto.org/debian/mosquitto-jessie.list -o /etc/apt/sources.list.d/mosquitto-jessie.list
RUN apt-get update
RUN apt-get install -y build-essential groff libssl-dev libffi-dev openssl mosquitto mosquitto-clients unzip python-dev python-pip vim less

RUN pip install --upgrade cffi==1.2.1 awscli
RUN curl https://raw.githubusercontent.com/trek10inc/awsume/master/awsume > /usr/local/bin/awsume && chmod 700 /usr/local/bin/awsume && echo "alias awsume='. awsume'" >> .bash_profile

ENV NODE_ENV local

#RUN npm install -g serverless@1.14

WORKDIR /development
