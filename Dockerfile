FROM nginx:1.9.8

RUN apt-get update

# Install python and pip for aws
RUN apt-get install -y python2.7 curl
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python2.7 get-pip.py

# Get awscli
RUN pip install awscli

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8000

CMD ["/run.sh"]
