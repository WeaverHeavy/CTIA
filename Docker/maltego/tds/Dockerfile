# Dockerfile for Canari
# Based on Dockerfile for Twisted from twistedmatrix (https://github.com/cyli/docker-twisted)
FROM ubuntu:14.04
MAINTAINER Adam Sealey <asealey@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

ENV         security_updates_as_of 2015-03-26

# Install Updates
# Install security updates and required packages
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y -q python-dev libffi-dev libssl-dev python-pip

# Install required python packages, and twisted
RUN pip install service_identity pycrypto && \
    pip install twisted==15.0.0


########## Setup Canari ###########
RUN pip install canari
WORKDIR /opt

# Setup Plume
RUN groupadd nobody && \
    canari install-plume

WORKDIR /opt/plume/
ADD resources/plume.sh /opt/plume/
RUN chmod +x /opt/plume/*.sh && \
    ln -fs /opt/tdsTransforms/canari.conf

# Create necessary directories for transforms/configs
RUN mkdir -p /opt/tdsTransforms
RUN mkdir -p /opt/ssl


# Patch Canari
ADD resources/message.py /usr/local/lib/python2.7/dist-packages/canari/maltego/

########## Setup Canari Twisted Listener ###########

EXPOSE 80

VOLUME "/opt/tdsTransforms"

WORKDIR /opt/plume
CMD ["/bin/bash"]
