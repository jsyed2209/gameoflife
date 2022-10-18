FROM ubuntu:18.04
USER SUDO
RUN  apt-get install openjdk-8-jdk
WORKDIR /myapp
COPY /var/lib/jenkins/.m2/repository/be/cegeka/gameoflife/0.0.3/gameoflife-0.0.3.war ./myapp
CMD ["nohup", "java" , "--port" , "8116",  "--path" , "/myapp" ,"myapp.war" , "&" ]
