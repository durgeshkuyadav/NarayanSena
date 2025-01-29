# Use an official OpenJDK runtime as a base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Spring Boot JAR file
COPY target/journalApp-0.0.1-SNAPSHOT.jar /app/application.jar

# Copy wait-for-it.sh and make it executable
COPY wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/wait-for-it.sh

# Expose backend port 9090 (matching your application.properties)
EXPOSE 9090

# Run the Spring Boot application with the wait-for-it.sh script
ENTRYPOINT ["/app/wait-for-it.sh", "database:3306", "--timeout=30", "--", "java", "-jar", "/app/application.jar"]
