# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file
COPY target/NarayanSena-0.0.1-SNAPSHOT.jar application.jar

# Copy the wait-for-it script
COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

# Expose the port
EXPOSE 9090

# Command to run the app
CMD ["/app/wait-for-it.sh", "database:3306", "--timeout=30", "--strict", "--", "java", "-jar", "/app/application.jar"]
