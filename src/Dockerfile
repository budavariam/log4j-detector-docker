FROM maven:3.8.4-jdk-8 AS builder
# build stage
WORKDIR /tmp
 
RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        procps \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mergebase/log4j-detector.git
RUN    cd ./log4j-detector/ \
    && mvn install \
    && cp "$(find /tmp/log4j-detector/ -iname 'log4j-detector*.jar' -maxdepth 1 | head -1)" "/tmp/log4j-detector.jar"


FROM openjdk:8-jre-alpine3.9
# run stage
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /tmp/log4j-detector.jar ./

CMD ["java", "-jar", "/app/log4j-detector.jar", "/data"]  
