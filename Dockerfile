# Use the official Maven image to build the application
# https://hub.docker.com/_/maven
FROM maven:3.8.4-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests

# Use the official OpenJDK image to run the application
# https://hub.docker.com/_/openjdk
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/order-service-0.0.1-SNAPSHOT.jar /usr/local/lib/orderservice.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/orderservice.jar"]