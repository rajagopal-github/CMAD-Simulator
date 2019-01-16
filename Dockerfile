FROM maven as build
WORKDIR /opt/cmad-simulator
COPY . .
RUN mvn clean compile assembly:single -DskipTests

FROM primetoninc/jdk:1.8
COPY --from=build /opt/cmad-simulator/target/simulator-0.0.1-SNAPSHOT.jar .
CMD java -jar simulator-0.0.1-SNAPSHOT.jar
