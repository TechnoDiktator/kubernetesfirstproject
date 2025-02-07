# Dockerfile
FROM almalinux:8  # Replaces CentOS 8 with AlmaLinux 8

LABEL maintainer="rastogitarang5@gmail.com"


RUN dnf update -y && dnf install -y \
    httpd \
    zip \
    unzip --setopt=tsflags=nodocs

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/

RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

#here we have exposed some more ports 
#also that we are running the app in fporeground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22