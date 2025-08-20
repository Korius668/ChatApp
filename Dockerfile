# Use AdoptOpenJDK image with Java 17
FROM adoptopenjdk:17-jdk
WORKDIR /app
COPY target/chat-app.jar /app/chat-app.jar
ENTRYPOINT ["java", "-jar", "chat-app.jar"]
