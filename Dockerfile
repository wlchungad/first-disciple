# grasscutter
FROM openjdk:17.0.2-slim 
# FROM eclipse-temurin:17-jdk-alpine
# First of all, run apt update and install required packages in one go
# While we are installing packages, we will also include MongoDB in this image
# RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apt update && \
    apt install -y git vim procps screen unzip

# We then compile the JAR
WORKDIR /opt
RUN git clone --recurse-submodules https://github.com/Grasscutters/Grasscutter.git
WORKDIR /opt/Grasscutter
RUN chmod +x gradlew
RUN ./gradlew jar
# also compiling the handbook
# RUN ./gradlew generateHandbook

WORKDIR /Grasscutter
RUN cp /opt/Grasscutter/grasscutter*.jar .

# since we are build from scratch, we can just call the 4.0.0 package directly
# remember to use quotes for URLs 
WORKDIR /tmp
# Download Audio Pack here
# For Chinese: https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Chinese_4.0.0.zip
# For English: https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_English(US)_4.0.0.zip
# For Japanes: https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Japanese_4.0.0.zip
# For Korean: https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Korean_4.0.0.zip
#RUN wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Japanese_4.0.0.zip"
# Download the gaime itself here
#RUN wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/GenshinImpact_4.0.0.zip"
#RUN unzip GenshinImpact_4.0.0.zip && unzip Audio_Japanese_4.0.0.zip

RUN rm -rf /opt/Grasscutter
RUN apt clean

EXPOSE 22102/udp
EXPOSE 443
EXPOSE 80
EXPOSE 8888 

ENTRYPOINT ["java" "-jar" "grasscutter*.jar"]