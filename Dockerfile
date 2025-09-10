FROM tomcat:11.0.10

RUN rm -rf /usr/local/tomcat/webapps/*

COPY *.war /usr/local/tomcat/webapps
FROM tomcat:11-jdk24
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/*.war .
EXPOSE 8080
# Sao chép file server.xml tùy chỉnh
COPY server.xml /usr/local/tomcat/conf/server.xml

CMD ["catalina.sh", "run"]
