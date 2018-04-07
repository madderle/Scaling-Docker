FROM python:3.6.3-slim

#Run an update
RUN apt-get update

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
