# SpringBoot Base Image

SpringBoot base image contains all the necessary dependencies. Image is based on Spring boot 2.4.0.
Image will be built for java 11 and above versions.

```
<properties>
    <java.version>11</java.version>
    <apache.httpclient.version>4.5.13</apache.httpclient.version>
    <google.gson.version>2.8.6</google.gson.version>
    <commons.version>2.8.0</commons.version>
    <jwt.version>0.9.1</jwt.version>
    <openapi.version>1.5.0</openapi.version>
    <micrometer.version>1.6.1</micrometer.version>
</properties>
```

Main purpose of this image is to use this as a builder image (in multistage build)

```
FROM xtremes/springbootbase as builder
RUN mkdir /app
WORKDIR /app
COPY src src
COPY pom.xml pom.xml
RUN mvn clean package
ENTRYPOINT "ls -al target/"

FROM openjdk:11.0.7-jre
WORKDIR /app
COPY --from=builder /app/target/my-application.jar /app/lib/application.jar
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar application.jar
```
