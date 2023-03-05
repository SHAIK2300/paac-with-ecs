FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone https://github.com/Hussain147/paac-with-ecs.git
RUN cd paac-with-ecs
RUN mvn install
