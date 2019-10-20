FROM centos

LABEL maintainer="benchu1k" version="1.0"

WORKDIR /root

ENV ENV=DEBUG

RUN useradd -s /sbin/nologin www
RUN mkdir .pip
RUN mkdir /home/www/front
RUN mkdir /home/www/LegalDailyCMS
COPY ./package/pip.config /root/.pip/pip.config

RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum upgrade -y
RUN yum install -y epel-release
RUN yum install -y gcc g++ zlib-devel openssl openssl-devel
RUN yum install -y python3 nginx
RUN pip3 install virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
RUN python3 -m venv /home/www/env

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
VOLUME [ "/home/www/front", "/home/www/LegalDailyCMS" ]

# ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "sh", "-c", "nginx;bash" ]