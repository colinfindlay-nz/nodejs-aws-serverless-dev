FROM node:12

RUN apt-get update
RUN apt-get install -y build-essential groff libssl-dev libffi-dev openssl jq unzip python-dev python-pip vim less

RUN pip install --upgrade cffi==1.2.1 awscli awsume

ENV NODE_ENV local

RUN npm install -g shelljs serverless@1.73 gulp mocha

WORKDIR /development
