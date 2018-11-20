#Version: 1.0.1
FROM ubuntu:latest

USER root

RUN apt-get update
RUN apt-get install -y git

RUN touch test.txt && echo "Hello Docker" >> abc.txt

VOLUME /var/lib/postgresql
