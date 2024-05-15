FROM openjdk:23-slim-bullseye
LABEL org.opencontainers.image.authors="hoainamnv34"



ENV DEBIAN_FRONTEND noninteractive

# JMeter version
ARG ZAP_VERSION=2.15.0 

# Install some utilities
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
                wget \
                telnet \
                iputils-ping \
                unzip

# Install JMeter
RUN   mkdir /zap \
      && cd /zap/ \
      && wget https://github.com/zaproxy/zaproxy/releases/download/v${ZAP_VERSION}/ZAP_${ZAP_VERSION}_Linux.tar.gz \
      && tar -xzf ZAP_${ZAP_VERSION}_Linux.tar.gz \
      && rm ZAP_${ZAP_VERSION}_Linux.tar.gz


# Set ZAP Home
ENV JMETER_HOME /zap/ZAP_${ZAP_VERSION}

WORKDIR $JMETER_HOME

ENTRYPOINT ["/bin/bash", "zap.sh", "-daemon", "-host", "0.0.0.0", "-port", "8083", "-config", "api.disablekey=true", "-config", "api.addrs.addr.name=.*", "-config", "api.addrs.addr.regex=true"]


