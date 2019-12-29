FROM alpin-oracle-server-jre:latest

# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]