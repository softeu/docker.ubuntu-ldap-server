#!/bin/bash

sudo chown -R openldap:openldap /var/lib/ldap/
chown root:syslog /var/log/
touch /var/log/syslog
chown syslog:adm /var/log/syslog

service rsyslog start

slapd  -g openldap -u openldap -h "ldap:/// ldapi:/// ldaps:///"  -F /etc/ldap/slapd.d/   -f /etc/ldap/slapd.conf

tail -F /var/log/syslog
