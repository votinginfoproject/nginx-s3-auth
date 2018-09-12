FROM quay.io/votinginfoproject/nginx-s3-proxy:update-nginx

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY nginx.conf /nginx.conf

CMD ["/run.sh"]
