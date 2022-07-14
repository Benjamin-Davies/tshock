FROM ubuntu:jammy

ENV TZ=Pacific/Auckland
# Suppress timezone prompt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget unzip mono-complete

WORKDIR /app
RUN wget https://github.com/Pryaxis/TShock/releases/download/v4.5.17/TShock4.5.17_Terraria_1.4.3.6.zip
RUN unzip *.zip

CMD mono TerrariaServer.exe -world /root/.local/share/Terraria/Worlds/$WORLD.wld
