FROM coopernurse/nginx-s3-proxy:latest

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY nginx.conf /nginx.conf

CMD ["/run.sh"]
