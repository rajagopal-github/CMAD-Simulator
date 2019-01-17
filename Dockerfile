FROM maven as build
WORKDIR /opt/cmad-simulator
COPY . .
RUN mvn clean compile assembly:single

FROM primetoninc/jdk:1.8
COPY --from=build /opt/cmad-simulator/target/simulator-0.0.1-SNAPSHOT-jar-with-dependencies.jar /opt/cmad-simulator/target/
CMD java -jar /opt/cmad-simulator/target/simulator-0.0.1-SNAPSHOT-jar-with-dependencies.jar
