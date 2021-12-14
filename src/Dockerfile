FROM openjdk:8-jre-alpine3.9
 
RUN apk update && apk add \
    git \
    procps \
    ca-certificates \
    && rm -rf /var/lib/apk/lists/*

RUN git clone https://github.com/mergebase/log4j-detector.git
RUN mkdir -p /data \
    && cd /log4j-detector/ \
    && ln -s "$(find /log4j-detector/ -iname '*.jar' -maxdepth 1 | head -1)" log4j-detector.jar

# COPY ./log4j-detector/* /app
 
# docker run --rm -v ${PWD}:/local -t -i logj /bin/sh
# CMD ["/bin/sh"]

# docker run --rm -v ${PWD}:/data logj
# RUN java -version
CMD ["java", "-jar", "/log4j-detector/log4j-detector.jar", "/data"]
