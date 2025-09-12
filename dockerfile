FROM maven:3.9.9-amazoncorretto-21 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests

FROM amazoncorretto:21-alpine
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]