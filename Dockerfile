FROM debian:buster

WORKDIR /server_srcs

RUN apt update && \
	apt upgrade && \
	apt install -y nginx && \
	apt install -y vim && \
	apt install -y mariadb-server && \
	apt install -y php-fpm php-mysql && \
	apt install -y wget && \
	apt install -y openssl && \
	apt install -y php7.3-fpm php7.3-mysql php7.3-xml php7.3-cli 

COPY ./srcs/ .

RUN service mysql start && mysql < init_db.sql

EXPOSE 80/tcp 443/tcp

CMD bash start_server.sh
