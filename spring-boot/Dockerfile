# Maven build container 

#FROM maven:3.6.3-openjdk-11 AS maven_build

#COPY pom.xml /tmp/

#COPY src /tmp/src/

#WORKDIR /tmp/

#RUN mvn package

#pull base image

FROM openjdk:latest

#copy hello world to docker image from builder image
COPY /target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/hello-world-0.1.0.jar
