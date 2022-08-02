FROM openjdk:11
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY **/target/**.war dockerworkspace.war
EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar dockerworkspace.war
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar dockerworkspace.jar
