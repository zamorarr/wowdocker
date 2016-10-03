#!/bin/sh

# Usage: ./s3.sh 
# expects env variables to provide aws key, aws secret, and s3bucket

WD=/home/docker/data

echo $(date) > $WD/lastuploaded
aws s3 sync $WD s3://${S3BUCKET}
