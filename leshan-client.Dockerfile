FROM eclipse-temurin:11
RUN mkdir /opt/app
RUN wget -O /opt/app/leshan-client-demo.jar https://ci.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-client-demo.jar

ENTRYPOINT ["java", "-jar", "/opt/app/leshan-client-demo.jar"]
CMD ["-u=coap://leshan-server:5683"]