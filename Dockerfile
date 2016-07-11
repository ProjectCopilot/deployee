FROM ubuntu:latest
MAINTAINER Ankit Ranjan "ankit@copilot.help"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential tmux
RUN pip install -r requirements.txt

