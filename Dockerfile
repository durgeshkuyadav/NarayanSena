# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the jar file into the container at /app
COPY target/journalApp-0.0.1-SNAPSHOT.jar /app/application.jar

# Make port 9090 available to the world outside this container
EXPOSE 9095

# Run the jar file
ENTRYPOINT ["java", "-jar", "application.jar"]
