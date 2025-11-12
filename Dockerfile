# Dockerfile
FROM openjdk:11-jre-slim
COPY target/myapp.jar /app/myapp.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
