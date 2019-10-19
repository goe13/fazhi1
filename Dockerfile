FROM centos

MAINTAINER benchu1k <benchu1k@gmail.com>

WORKDIR /root

ENV ENV=DEBUG

RUN useradd -s /sbin/nologin www
RUN mkdir .pip
RUN mkdir /home/www/front
RUN mkdir /home/www/LegalDailyCMS
COPY ./package/pip.config /root/.pip/pip.config

RUN yum upgrade -y
RUN yum install -y epel-release
RUN yum install -y gcc g++ zlib-devel openssl openssl-devel
RUN yum install -y python3 nginx
RUN pip3 install virtualenv
RUN virtualenv /home/www/env 

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

CMD [ "nginx" ]
