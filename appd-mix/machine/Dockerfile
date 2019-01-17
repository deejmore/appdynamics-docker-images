FROM debian AS builder

MAINTAINER mark.prichard@appdynamics.com

ARG APPD_MACHINE_AGENT_VERSION
ARG APPD_MACHINE_AGENT_SHA256

RUN apt-get update && apt-get install -y --no-install-recommends  unzip \
        && rm -rf /var/lib/apt/lists/*

COPY machineagent-bundle-64bit-linux-${APPD_MACHINE_AGENT_VERSION}.zip /
RUN echo "${APPD_MACHINE_AGENT_SHA256} *machineagent-bundle-64bit-linux-${APPD_MACHINE_AGENT_VERSION}.zip" >> appd_checksum \
    && sha256sum -c appd_checksum \
    && rm appd_checksum \
    && unzip -oq machineagent-bundle-64bit-linux-${APPD_MACHINE_AGENT_VERSION}.zip -d /tmp

CMD ["sh", "-c", "java ${MACHINE_AGENT_PROPERTIES} -jar /opt/appdynamics/machineagent.jar"]