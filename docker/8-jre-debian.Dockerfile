FROM adoptopenjdk/openjdk8:debian-jre

RUN useradd runner \
 && mkdir -p /opt/app /home/runner \
 && chown runner /opt/app /home/runner
WORKDIR /opt/app

COPY bin /usr/local/bin/
COPY kieker/kieker-1.14-aspectj.jar /opt/kieker/kieker-aspectj.jar
COPY --chown=runner kieker/kieker.monitoring.properties /opt/app/META-INF/
