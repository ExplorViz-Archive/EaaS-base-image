FROM adoptopenjdk/openjdk11:debian-jre

RUN useradd runner \
 && mkdir -p /opt/app /home/runner \
 && chown runner /opt/app /home/runner

COPY bin /usr/local/bin/
COPY kieker/kieker-aspectj.jar /opt/kieker/
# Alternative approach to download kieker jar from public repository
#ARG KIEKER_URL=https://oss.sonatype.org/service/local/repositories/snapshots/content/net/kieker-monitoring/kieker/1.14-SNAPSHOT/kieker-1.14-20200308.063903-409-aspectj.jar
#ARG KIEKER_SHA256=18b8f9b5079a387f45247724f4ceec7a324b85089a8bc7a8fe2b03d92b920e10
#ADD $KIEKER_URL /opt/kieker/kieker-aspectj.jar
#RUN echo "$KIEKER_SHA256 */opt/kieker/kieker-aspectj.jar" | sha256sum -c -

COPY --chown=runner kieker/kieker.monitoring.properties /opt/app/META-INF/

# Defaults for the application images
USER runner
WORKDIR /opt/app
CMD ["/opt/app/run.sh"]
