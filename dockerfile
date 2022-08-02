FROM openjdk:8-jdk-alpine
COPY pom.xml .
COPY src .
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY ${JAR_FILE} /app.jar
EXPOSE 8080
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar

# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar dockerworkspace.jar
