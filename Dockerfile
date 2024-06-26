FROM ubuntu:22.04

# Install OpenJDK 17 JDK
RUN apt-get update && apt-get install -y openjdk-17-jdk && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the JAR file to the container
COPY cloud-0.0.2.jar /app/cloud-0.0.2.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/cloud-0.0.2.jar"]
