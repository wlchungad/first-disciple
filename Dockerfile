# Start the base model with openjdk 17 official images
FROM openjdk:17.0.2-slim AS builder

# First of all, run apt update and install required packages in one go
RUN apt update && apt install -y git vim procps screen wget unzip && apt clean && rm -rf /var/lib/apt/lists/*

# We then compile the JAR
WORKDIR /opt
RUN git clone --depth 1 --recurse-submodules https://github.com/Grasscutters/Grasscutter.git
WORKDIR /opt/Grasscutter
RUN chmod +x gradlew && ./gradlew jar

# Move to a proper folder after compliation
# WORKDIR /Grasscutter
# RUN cp -rf /opt/Grasscutter /Grasscutter

# Run stage
FROM openjdk:17.0.2-slim AS run_stage

COPY --from=builder /opt/Grasscutter /app

EXPOSE 22102/udp 443/tcp 80/tcp 8888/tcp

# ENTRYPOINT ["ls", "-l", "/opt/Grasscutter"]
# ENTRYPOINT ["java", "-cp", "/opt/Grasscutter/*"]
ENTRYPOINT ["java", "-jar", "/app/grasscutter-1.7.4.jar"]

# Since we are building from scratch, we can just call the 4.0.0 package directly
# In case 4.0.0 direct dowload link is down, we can use 3.8.0 package + diff package of 4.0.0 to achieve the same effect
# Remember to use quotes for URLs 
# Here I will use JP Audio Pack as example, changes links to be CN/EN/KR depending on preference
# Download Audio Pack here then also the game itself 
# RUN wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/Audio_Japanese_4.0.0.zip" \
#     --progress=bar:force && unzip Audio_Japanese_4.0.0.zip && rm Audio_Japanese_4.0.0.zip
# RUN wget -c "https://autopatchhk.yuanshen.com/client_app/download/pc_zip/20230804185804_eTmE8EZjJZdAJapq/GenshinImpact_4.0.0.zip"\
#     --progress=bar:force 
# RUN unzip GenshinImpact_4.0.0.zip && rm GenshinImpact_4.0.0.zip

