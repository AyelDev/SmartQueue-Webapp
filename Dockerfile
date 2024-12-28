FROM maven:3.9.7-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package

FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps/

COPY --from=build /app/target/smartqueueweb.war ./smartqueueweb.war

EXPOSE 8080

ENV PORT 8080

CMD ["catalina.sh", "run"]