FROM centos:7

RUN yum install -y \
    httpd \
    zip \
    unzip \
    ca-certificates \
    curl \
    && yum clean all

WORKDIR /var/www/html

RUN curl -L -o viking.zip \
    https://www.free-css.com/assets/files/free-css-templates/download/page285/viking.zip \
    && unzip viking.zip \
    && cp -rvf viking/* . \
    && rm -rf viking viking.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 443