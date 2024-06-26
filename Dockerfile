# First stage: Build
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

# Copy the JAR file to the build container
COPY cloud-0.0.2.jar /app/cloud-0.0.2.jar

# Extract the JAR file to get the dependencies
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf /app/cloud-0.0.2.jar)

# Second stage: Run
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the necessary files from the build stage
COPY --from=build /app/target/dependency/BOOT-INF/lib /app/lib
COPY --from=build /app/target/dependency/META-INF /app/META-INF
COPY --from=build /app/target/dependency/BOOT-INF/classes /app

EXPOSE 8080

CMD ["java", "-cp", "/app:/app/lib/*", "org.springframework.boot.loader.JarLauncher"]
