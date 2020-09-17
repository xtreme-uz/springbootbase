# SpringBoot Base Image

SpringBoot base image contains all the necessary dependencies. Image is based on Spring boot 2.3.3.
Image will be built for java 11 and above versions.

```
<properties>
	<java.version>11</java.version>
	<apache.httpclient.version>4.5.12</apache.httpclient.version>
	<google.gson.version>2.8.6</google.gson.version>
	<commons.version>2.7</commons.version>
	<jwt.version>0.9.1</jwt.version>
	<unirest.version>1.4.9</unirest.version>
	<swagger.version>2.9.2</swagger.version>
</properties>
```

Main purpose of this image is to use this as a builder image (in multistage build)

```
FROM xtremes/springbootbase as builder
WORKDIR /app
COPY src /app/src
COPY pom.xml /app/

RUN cd /app
RUN mvn clean install

ENTRYPOINT "ls -al target/"

FROM openjdk:11.0.3-jdk-slim-stretch

WORKDIR /app
COPY --from=builder /app/target/code-master.jar /app/
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar somce-jar.jar
```
