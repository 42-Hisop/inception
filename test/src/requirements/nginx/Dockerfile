FROM	debian:buster

RUN		apt-get update -y && apt-get upgrade -y && \
		apt-get install -y nginx openssl vim
		
#RUN		mkdir -p /etc/nginx/ssl

#RUN		openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
#		-out /etc/nginx/ssl/nginx.crt \
#		-keyout /etc/nginx/ssl/nginx.key \
#		-subj "/C=KR/ST=Seoul/L=Seoul/O=wordpress/CN=khee-seo.42.fr/"

#COPY	conf/nginx_tmp.conf /etc/nginx/conf.d/default.conf

#EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
