FROM ubuntu:14.04
MAINTAINER Jindrich Vimr <jvimr@softeu.com>

RUN echo "1.565.1" > .lts-version-number

RUN apt-get update && apt-get install -y wget git curl zip vim
RUN apt-get update && apt-get install -y slapd

COPY run-ldap.sh /

COPY ./copy/ /etc/ssl/certs/


#VOLUME ["/var/lib/ldap/",   "/var/lib/slapd/", "/etc/slapd/" ]



EXPOSE 389
EXPOSE 636

WORKDIR /var/lib


CMD ["/run-ldap.sh"]

