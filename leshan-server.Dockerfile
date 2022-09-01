FROM eclipse-temurin:11
RUN mkdir /opt/app
RUN wget -O /opt/app/leshan-server-demo.jar https://ci.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar

ENTRYPOINT ["java", "-jar", "/opt/app/leshan-server-demo.jar"]