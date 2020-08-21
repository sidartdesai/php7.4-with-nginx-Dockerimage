FROM ubuntu:latest
RUN apt update && apt install -y \
    nginx
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl

#COPY ./start.sh /start.sh
#RUN chmod +x start.sh

RUN mkdir /home/data
COPY index.html /home/data/
COPY info.php /home/data/
RUN chown -R www-data:www-data /home/data/
RUN mkdir /etc/nginx/sites
COPY localhost.conf /etc/nginx/sites
COPY nginx.conf /etc/nginx/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#CMD ["/bin/bash", "/start.sh"]
