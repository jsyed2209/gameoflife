FROM ubuntu:18.04
USER root
RUN  apt-get update -y && \
     add-apt-repository ppa:webupd8team/java -y && \
	 apt-get update -y && \
	 apt-get install oracle-java8-installer
	 
RUN mkdir -p /home/app
COPY /var/lib/jenkins/.m2/repository/be/cegeka/gameoflife/0.0.3/gameoflife-0.0.3.war ./home/app
WORKDIR /home/app
CMD ["nohup", "java" , "--port" , "8116",  "--path" , "/home/app" ,"myapp.war" , "&" ]



