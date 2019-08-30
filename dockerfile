FROM maven:3.6.1-ibmjava-8

# Set the working directory to /
WORKDIR /

# Copy the current directory contents into the container at /
COPY . /

RUN mvn package
VOLUME ["/usr/share/maven","/root/.m2"]
FROM openjdk:8

WORKDIR /
# coppy từ image 0 với url thư mục  WebXBE/target/ đến / của container này
COPY --from=0 /target/ .
CMD ["java","-jar","docker-test-1.0-SNAPSHOT.jar"]
