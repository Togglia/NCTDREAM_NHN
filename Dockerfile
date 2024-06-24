FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY cloud-0.0.2.jar /app/cloud-0.0.2.jar

EXPOSE 80801

CMD ["java", "-jar", "/app/cloud-0.0.2.jar"]

