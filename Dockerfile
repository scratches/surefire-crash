FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD . /source
ENTRYPOINT ["/bin/sh"]