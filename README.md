# WoW Docker

This is a set of docker containers to use Blizzard's API to download Auction data from user-specified realms and upload them to a specified s3 bucket. This application uses docker-compose to manage the uploader and downloader. It expects that your host has the following environment variables defined:

- **BLIZZARD_API_KEY** your Blizzard API key. Obtain from dev.battle.net
- **AWS_ACCESS_KEY_ID** your AWS access key
- **AWS_SECRET_ACCESS_KEY** your AWS secret access key.
- **S3BUCKET** the name of the s3 bucket to upload auction data to. Do not prepend with s3://

## To start containers
In this project's root directory, type `sudo docker-compose up` at the shell.

## Customizing
To change the realms to download data from, edit the downloader/cron.tab file space-delimited list of realms (defaulting to Dalran and Kalecgos). You can also edit this file to change the frequency of downloads.

Similiary, edit the uploader/cron.tab file to change the frequency of uploads.