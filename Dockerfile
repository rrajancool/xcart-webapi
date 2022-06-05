FROM openjdk:11

EXPOSE 8080

WORKDIR /applications

COPY target/*.jar /applications/app.jar

ENTRYPOINT ["java","-jar", "app.jar"]

#execute the application
#ENTRYPOINT ["java","-cp","app:app/lib/*","com.poc.userinfo.UserInfoApplication"]