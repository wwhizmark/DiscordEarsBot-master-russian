FROM ubuntu:latest

RUN mkdir /var/www/
RUN mkdir /var/www/DiscordEarsBot-master-russian
WORKDIR /var/www/DiscordEarsBot-master-russian

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y git vim g++ cmake

RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get -y install nodejs 

RUN git clone https://github.com/wwhizmark/DiscordEarsBot-master-russian.git .
RUN npm install
RUN npm update
RUN npm install pm2@latest -g

# provide API credentials through the settings.json file OR the environment variables: 

# COPY settings.json /var/www/DiscordEarsBot-master-russian/settings.json

# ENV DISCORD_TOK=

CMD git pull && npm update && pm2 start ecosystem.config.js
