#!/bin/bash


cd /home/jovyan

cp -rp tp/* /var/www/html/

source /etc/apache2/envvars
apache2

