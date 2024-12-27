FROM maven:3.9.7-eclipse-temurin-21 AS build

COPY . .

RUN mvn clean package

FROM tomcat:9.0

COPY --from=build /target/smartqueueweb.war /usr/local/tomcat/webapps/smartqueueweb.war

EXPOSE 8080

CMD ["catalina.sh", "run"]