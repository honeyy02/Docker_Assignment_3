#Use the maven image as the base image
FROM maven:3.8.1-jdk-11
#sets the working dir in the container as /app
WORKDIR /app
#copy all the files from local dir to container
COPY . .
#run the command to compiles your Maven project and packages it into a JAR file. The resulting JAR file is stored in the /app/target directory.
RUN mvn clean package