FROM jbangdev/jbang-action AS generate-source

WORKDIR /src
COPY ${PWD}/RestRoute.java .

RUN  jbang trust add https://github.com && \
    jbang app install camel@apache/camel && \
    EXPORT_DIR=$(pwd) && \
    rm -rf $EXPORT_DIR && \
    mkdir $EXPORT_DIR && \
    camel export --gav=my.company:restroute:1.0.0 -dir=$EXPORT_DIR --runtime=camel-main

FROM maven AS build
COPY --from=generate-source /src /src
RUN mvn clean install

FROM openjdk:11-jre 
WORKDIR /camel
COPY --from=build /src/target/restroute-1.0.0.jar .
CMD ["java", "-jar", "restroute-1.0.0.jar"]
