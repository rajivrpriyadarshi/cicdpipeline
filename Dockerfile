FROM eclipse-temurin:17
FROM maven:3.6.3-jdk-11 AS build
WORKDIR /app
COPY target/cicdproject-0.0.1-SNAPSHOT.jar /app/cicdproject.jar
ENTRYPOINT ["java", "-jar", "cicdproject.jar"]