FROM openjdk:8-jre-slim AS builder

MAINTAINER mark.prichard@appdynamics.com

ARG APPD_MACHINEAGENT_VERSION
ARG APPD_MACHINEAGENT_SHA256

COPY MachineAgent-${APPD_MACHINEAGENT_VERSION}.zip /
RUN echo "${APPD_MACHINEAGENT_SHA256} *MachineAgent-${APPD_MACHINEAGENT_VERSION}.zip" >> appd_checksum \
    && sha256sum -c appd_checksum \
    && rm appd_checksum \
    && unzip -oq MachineAgent-${APPD_MACHINEAGENT_VERSION}.zip -d /tmp


FROM openjdk:8-jre-slim
RUN apt-get update && apt-get -y upgrade && apt-get install -y unzip && apt-get install -y apt-utils && apt-get install -y iproute2 && apt-get install -y procps && apt-get install -y sysstat
COPY --from=builder /tmp /opt/appdynamics

CMD ["sh", "-c", "java ${MACHINE_AGENT_PROPERTIES} -jar /opt/appdynamics/machineagent.jar"]
