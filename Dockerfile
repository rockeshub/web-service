FROM tomcat:latest
VOLUME /opt:/opt
ADD /target/webservice-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
ENV JHIPSTER_SLEEP=0
COPY ./script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]
CMD ["script.sh", "run"]
