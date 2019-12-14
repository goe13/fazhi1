FROM centos:7

LABEL maintainer="benchu1k" version="1.0"

WORKDIR /root

ENV ENV=DEBUG

RUN useradd -s /sbin/nologin www
RUN mkdir .pip
RUN mkdir /home/www/front
RUN mkdir /home/www/LegalDailyCMS
COPY ./package/pip.config /root/.pip/pip.config

RUN yum install wget -y
# RUN rm -f /etc/yum.repos.d/CentOS-Base.repo
# RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum upgrade -y
RUN yum install -y epel-release
RUN yum groupinstall "development tools" -y
RUN yum install -y python3 python3-devel nginx
RUN pip3 install virtualenv -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com
RUN python3 -m venv /home/www/env

COPY ./package/requirements.txt /root/requirements.txt
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN source /home/www/env/bin/activate && pip install -r /root/requirements.txt -i http://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

EXPOSE 80

VOLUME [ "/home/www/front", "/home/www/LegalDailyCMS" ]
# ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "sh", "-c", "nginx;bash" ]