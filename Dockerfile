#FROM openjdk:17
#
## Set default values for environment variables
#ENV APP_PORT=8080
#ENV MONGO_PORT=27017
#
## Expose the specified ports
#EXPOSE $APP_PORT $MONGO_PORT
#
#ADD target/mongodock.jar mongodock.jar
#
## Use CMD instead of ENTRYPOINT to allow for variable substitution
#CMD ["java", "-jar", "/mongodock.jar", "--server.port=${APP_PORT}", "--mongo.port=${MONGO_PORT}"]
#
#
#docker run -e APP_PORT=8081 -e MONGO_PORT=27018 -p 8081:8081 -p 27018:27018 your_image_name

FROM openjdk:17
EXPOSE 8080
ADD target/mongodock.jar mongodock.jar
ENTRYPOINT ["java", "-jar","/mongodock.jar"]



#FROM openjdk:17
##all the commands inside this image will be going to be executed in /app folder
#WORKDIR /mongoApp
#COPY ./build/libs/mongodock.jar /mongoApp/mongodock.jar
## Assuming you have Maven installed
##install necessary pacakages , so the user should not run these commands manually
##therefore we need to provide it here so when image is executed it will auto
##matically start with the following run commands
#RUN mvn clean install
#EXPOSE 8080
##jo bhi folder neeche mention kiya h usme jar file create hojygi jaise iss case mei
## target folder h
#ADD target/mongodock.jar mongodock.jar
#CMD ["java", "-jar", "mongodock.jar"]
##first file that we want to excecute inside the docker container
#ENTRYPOINT ["java", "-jar","/mongodock.jar"]

#example of add which can fetch from external URL
#FROM ubuntu:latest
#WORKDIR /app
#ADD http://example.com/archive.tar.gz /app/
#RUN tar -xzf archive.tar.gz

#example of copy which can fetch from only local system files
#FROM ubuntu:latest
#WORKDIR /app
#COPY ./archive.tar.gz /app/
#RUN tar -xzf archive.tar.gz

