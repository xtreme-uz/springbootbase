FROM maven:3.6.1-jdk-12

LABEL Author="kasun.ranasinghe@icloud.com" 

WORKDIR /base
COPY . /base/
RUN cd /base/
RUN mvn install

ENTRYPOINT "java -jar /base/target/spring-boot-dependencies.jar"