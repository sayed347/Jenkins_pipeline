FROM maven:3.5.4-jdk-8-alpine
MAINTAINER drissi sayed
RUN apk update
RUN apk add -y maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn package
COPY target/docker-maven-1.0-SNAPSHOT.jar /usr/local/service/docker-maven-1.0-SNAPSHOT.jar
CMD ["java","-cp","/usr/local/service/docker-maven-1.0-SNAPSHOT.jar","org.ea.service.App"]