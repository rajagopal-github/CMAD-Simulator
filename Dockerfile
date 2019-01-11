FROM maven as build
WORKDIR /opt/cmad-simulator
COPY . .
RUN mvn package -DskipTests

FROM primetoninc/jdk:1.8
COPY --from=build /opt/cmad-simulator/target/simulator-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD java -jar simulator-0.0.1-SNAPSHOT.jar
