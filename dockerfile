FROM maven AS build
WORKDIR /src
COPY ${PWD}/src .
RUN mvn camel:run

#FROM openjdk:11-jre 
#WORKDIR /camel
#COPY --from=build /src/target/restroute-1.0.0-runner.jar .
#CMD ["java", "-jar", "restroute-1.0.0-runner.jar"]
