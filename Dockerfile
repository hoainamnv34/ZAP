FROM hoainamnv34/zap-base:0.0.1
LABEL org.opencontainers.image.authors="hoainamnv34"


ENV DEBIAN_FRONTEND noninteractive

# ZAP version
ARG ZAP_VERSION=2.15.0 

# Set ZAP Home
ENV ZAP_HOME /zap/ZAP_${ZAP_VERSION}

WORKDIR $ZAP_HOME


ENTRYPOINT ["/bin/bash", "zap.sh", "-daemon", "-host", "0.0.0.0", "-port", "8083", "-config", "api.disablekey=true", "-config", "api.addrs.addr.name=.*", "-config", "api.addrs.addr.regex=true", "-config", "database.recoverylog=false", "-config", "connection.timeoutInSecs=120"]

# HEALTHCHECK --retries=5 --interval=5s CMD /bin/bash zap.sh status


