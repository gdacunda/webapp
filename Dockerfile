FROM tomcat:8.5.27-jre8
MAINTAINER DinoCloud (dinocloud@xxxxx.com)
COPY ./target/webappExample.war /usr/local/tomcat/webapps/
