# Dockerfile
FROM eclipse-temurin:11-jre
COPY target/myapp.jar /app/myapp.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "myapp-1.0-SNAPSHOT.jar"]
