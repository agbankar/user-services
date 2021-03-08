FROM openjdk:8-jdk-alpine
WORKDIR /opt
ADD target/user-service-0.0.1-SNAPSHOT.jar user-service-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
EXPOSE 8080
CMD ["java", "-jar" , "/opt/user-service-0.0.1-SNAPSHOT.jar"]
# run  below command to run the container
# docker run -d -p 8080:8080 {image}:{tag}