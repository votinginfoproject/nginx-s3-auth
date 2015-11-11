#!/bin/bash

: "${USERNAME:?You gotta set USERNAME}"
: "${PASSWORD:?You gotta set PASSWORD}"
: "${AWS_ACCESS_KEY:?You gotta set AWS_ACCESS_KEY}"
: "${AWS_SECRET_KEY:?You gotta set AWS_SECRET_KEY}"
: "${S3_BUCKET:?You gotta set S3_BUCKET}"
: "${AUTH_REALM:?You gotta set AUTH_REALM}"

echo ${USERNAME}:${PASSWORD} > /htpasswd

sed -i "s/AWS_ACCESS_KEY/${AWS_ACCESS_KEY}/" /nginx.conf
sed -i "s/AWS_SECRET_KEY/${AWS_SECRET_KEY}/" /nginx.conf

sed -i "s/S3_BUCKET/${S3_BUCKET}/g" /nginx.conf

sed -i "s/AUTH_REALM/${AUTH_REALM}/" /nginx.conf

/usr/local/nginx/sbin/nginx -c /nginx.conf $@
