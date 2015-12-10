#!/bin/bash

: "${USERNAME:?You gotta set USERNAME}"
: "${PASSWORD:?You gotta set PASSWORD}"
: "${AWS_ACCESS_KEY_ID:?You gotta set AWS_ACCESS_KEY_ID}"
: "${AWS_SECRET_ACCESS_KEY:?You gotta set AWS_SECRET_ACCESS_KEY}"
: "${S3_BUCKET:?You gotta set S3_BUCKET}"
: "${AUTH_REALM:?You gotta set AUTH_REALM}"

echo ${USERNAME}:${PASSWORD} > /htpasswd

sed -i "s/AUTH_REALM/${AUTH_REALM}/" /etc/nginx/nginx.conf

mkdir -p /var/www/nginx-s3-auth

aws s3 sync s3://$S3_BUCKET /var/www/nginx-s3-auth

/usr/sbin/nginx $@
