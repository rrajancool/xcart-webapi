#stage 1
#Start with a base image containing Java runtime
FROM openjdk:11-slim as build

# Add Maintainer Info
LABEL maintainer="Rathish Rajan <rathish1.rajan@gmail.com>"

# The application's jar file
ARG JAR_FILE

WORKDIR /applications
# Add the application's jar to the container

#RUN echo ${JAR_FILE}
COPY target/*.jar /applications/app.jar

#unpackage jar file
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf /applications/app.jar)

#stage 2
#Same Java runtime
FROM openjdk:11-slim

#Add volume pointing to /tmp
VOLUME /tmp

#Copy unpackaged application to new container
ARG DEPENDENCY=target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

#execute the application
ENTRYPOINT ["java","-cp","app:app/lib/*","com.poc.userinfo.UserInfoApplication"]