FROM tomcat:9.0

COPY  target/smartqueueweb.war /usr/local/tomcat/webapps/smartqueueweb.war

EXPOSE 8080

CMD ["catalina.sh", "run"]