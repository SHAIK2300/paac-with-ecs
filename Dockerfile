FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone https://github.com/Hussain147/paac_with_ecs.git
RUN cd paac_with_ecs && mvn install


FROM tomcat:8-jre11
LABEL "Project"="techieapp"
LABEL "Author"="Hussain"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/server.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
WORKDIR /usr/local/tomcat/
VOLUME /usr/local/tomcat/webapps