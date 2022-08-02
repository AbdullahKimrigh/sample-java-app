FROM openjdk:11
# COPY src .
# VOLUME /tmp
# ARG JAVA_OPTS
# ENV JAVA_OPTS=$JAVA_OPTS
# COPY build/libs/helloworld-1.0-SNAPSHOT.jar dockerworkspace.jar

RUN mkdir /project
COPY . /project
WORKDIR /project
RUN mvn clean package -DskipTests
CMD ["java", "-jar", "target/helloworld-1.0-SNAPSHOT.jar"]

EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar helloworld-1.0-SNAPSHOT.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar dockerworkspace.jar
