FROM openjdk:8-jdk

RUN apt-get update && \
    apt-get install apt-transport-https bc ca-certificates software-properties-common -y

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    apt-get install sbt -y

WORKDIR /opt/database-ha-testing

COPY . .

#RUN sbt assembly
#
#ENTRYPOINT ["java"]
#
#CMD ["-jar", "target/scala-2.12/database-ha-testing-assembly.jar"]

#EXPOSE 5005

ENTRYPOINT ["sbt"]

CMD ["run"]

#CMD ["-jvm-debug", "5005", "run"]