FROM openjdk:11
VOLUME /tmp
COPY src /home/app/src
COPY pom.xml /home/app
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY home/app/target/helloworld-1.0-SNAPSHOT.jar dockerworkspace.jar
EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar dockerworkspace.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar dockerworkspace.jar
