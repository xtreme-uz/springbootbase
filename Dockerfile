FROM maven:3.6.3-jdk-11-slim
LABEL Author="rustambekov.mail.box@gmail.com" 

WORKDIR /base
COPY . /base/
RUN cd /base/
RUN mvn install

ENTRYPOINT "java -jar /base/target/spring-boot-dependencies.jar"