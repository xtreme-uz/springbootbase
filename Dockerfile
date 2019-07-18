FROM maven:3.6.1-jdk-11-slim
LABEL Author="kasun.ranasinghe@icloud.com" 

WORKDIR /base
COPY . /base/
RUN cd /base/
RUN mvn install

ENTRYPOINT "java -jar target/spring-boot-dependencies.jar"