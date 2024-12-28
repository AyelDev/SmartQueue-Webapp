FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps/

COPY --from=build /app/target/smartqueueweb.war ./smartqueueweb.war

EXPOSE 8080

CMD ["catalina.sh", "run"]