FROM openjdk:11
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
RUN mkdir myapp
COPY ./services/ui/widget/ /myapp/
COPY ./.env /myapp/
COPY ../.config myapp
COPY ../.procps myapp
COPY ../.profile myapp

COPY target/helloworld-1.0-SNAPSHOT.jar dockerworkspace.jar
EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar dockerworkspace.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar dockerworkspace.jar
