# Base Image
FROM alpine:latest 

# Metadata
MAINTAINER rz github.com/zamorarr

#  Install external dependencies
RUN apk add --no-cache python py-pip py-setuptools ca-certificates groff less
RUN pip --no-cache-dir install awscli

# Create working directory
RUN mkdir -p /home/docker/data
WORKDIR /home/docker

# Add support scripts 
ADD s3.sh s3.sh
ADD cron.tab cron.tab

# Save env for cron
RUN env > myenv.env

# Run Cronjob
RUN crontab cron.tab
CMD [ "crond", "-fS", "-l", "2" ]
