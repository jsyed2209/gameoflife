FROM ubuntu:16.04
USER root
# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean;
    
# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
	 
RUN mkdir -p /home/app
#COPY /var/lib/jenkins/.m2/repository/be/cegeka/gameoflife/0.0.3/gameoflife-0.0.3.war ./home/app
ADD https://gameoflifeapp.s3.amazonaws.com/gameoflife-0.0.3.war /home/app
WORKDIR /home/app
CMD ["java" ,"myapp.war"]



