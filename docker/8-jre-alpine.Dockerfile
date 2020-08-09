FROM adoptopenjdk/openjdk8:alpine-jre

RUN adduser -D -h /home/runner runner \
 && mkdir -p /opt/app \
 && chown runner /opt/app
WORKDIR /opt/app

COPY bin /usr/local/bin/
COPY kieker/kieker-1.14-aspectj.jar /opt/kieker/kieker-aspectj.jar
COPY --chown=runner kieker/kieker.monitoring.properties /opt/app/META-INF/
