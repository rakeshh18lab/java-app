FROM eclipse-temurin:11-jdk
COPY target/myapp-1.0-SNAPSHOT.jar /app/myapp.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "myapp.jar"]
