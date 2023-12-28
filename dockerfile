FROM maven:latest AS builder
WORKDIR /usr/src/app
COPY . .
RUN mvn clean install
FROM tomcat:latest
COPY --from=builder /usr/src/app/target/onlinebookstore.war /usr/local/tomcat/webapps
CMD [ "catalina.sh","run" ]

