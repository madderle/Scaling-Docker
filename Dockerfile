FROM python:3.6.3-slim

#Run an update
RUN apt-get update && apt-get -y install curl unzip && cd /tmp && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && unzip awscli-bundle.zip && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && rm awscli-bundle.zip && rm -rf awscli-bundle

#Create a user ds
RUN adduser -D -S -h /home/ds -s /bin/ash ds

#install neccessary packages
RUN pip install tweepy pymongo boto3 numpy pandas schedule redis jupyter mysql-connector==2.1.4 sqlalchemy

#Set Variables
ENV HOME=/home/ds
ENV SHELL=/bin/bash
ENV USER=ds
VOLUME /home/ds
WORKDIR /home/ds
