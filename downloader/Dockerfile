# Base Image
FROM alpine:latest 

# Metadata
MAINTAINER rz github.com/zamorarr

#  Install external dependencies
RUN apk add --no-cache curl 

# Create working directory
RUN mkdir -p /home/docker/data
WORKDIR /home/docker

# Add support scripts 
ADD api.sh api.sh
ADD cron.tab cron.tab

# Make Volume available
VOLUME /home/docker/data

# Run Cronjob
RUN crontab cron.tab
CMD env > myenv.env && crond -fS -l 2 
