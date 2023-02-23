#!/bin/bash
yum install --quiet -y httpd-devel


cp httpd.conf /etc/httpd/conf/httpd.conf
cp httpd-vhosts /etc/httpd/conf/httpd-vhosts.conf

service httpd start 
chkconfig httpd on 