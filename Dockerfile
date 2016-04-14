FROM anapsix/alpine-java:jre8 

# China time
RUN wget -O /etc/localtime https://github.com/362228416/docker/raw/master/Shanghai

ENV TOMCAT=apache-tomcat  \
    TOMCAT_VERSION=8.0.33 \
    JAVA_OPTS='-server -Duser.timezone=Asia/Shangha' \
    CATALINA_HOME=/tomcat
    
# download and install tomcat
RUN wget http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/${TOMCAT}-${TOMCAT_VERSION}.tar.gz
RUN tar zxvf ${TOMCAT}-${TOMCAT_VERSION}.tar.gz
RUN rm ${TOMCAT}-${TOMCAT_VERSION}.tar.gz
RUN mv /${TOMCAT}-${TOMCAT_VERSION} /tomcat
RUN rm -rf /tomcat/webapps/*

EXPOSE 8080
WORKDIR /tomcat

# startup script
RUN echo -e '#!/bin/bash \ncd /tomcat \nbin/startup.sh \ntail -f logs/catalina.out' > /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh





