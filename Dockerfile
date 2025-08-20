# Use Eclipse Temurin image with Java 17
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/chat-app.jar /app/chat-app.jar
ENTRYPOINT ["java", "-jar", "chat-app.jar"]