FROM maven AS build
WORKDIR /src
COPY ${PWD}/src .
RUN mvn install

FROM openjdk:11-jre 
WORKDIR /camel
COPY --from=build /src/target/restroute-1.0.0.jar .
CMD ["java", "-jar", "restroute-1.0.0.jar"]
