# nginx-s3-auth

A Docker container for proxying S3 buckets as websites w/ HTTP Basic Auth.

## Usage

1. `docker build -t nginx-s3-auth .`
1. `docker run -p 8000:8000 -e USERNAME=user -e PASSWORD=encrypted-password -e AWS_ACCESS_KEY=AKIA... -e AWS_SECRET_KEY=supersecret -e AUTH_REALM=my-site -e S3_BUCKET=my-bucket nginx-s3-auth`

The encrypted-password is crypt() format and will go into the htpasswd file.
It can be generated with Apache's `htpasswd` utility or `openssl passwd` among
other methods.

### Running in CoreOS

1. `script/build` will generate a service unit file named nginx-s3-auth@.service
1. `fleetctl submit nginx-s3-auth@.service`
1. `fleetctl start nginx-s3-auth@1` will run an instance of this in your cluster

Or you can run `script/deploy` after `script/build` which will submit and start
3 instances in whatever cluster your fleetctl config is pointing at.
