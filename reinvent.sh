#!/bin/zsh
set -e

## Set colors for terminal
NOCOLOR='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'

## Prep screen
clear
echo "${GREEN}ReInvent Scraper --${NOCOLOR}"

## Ask for URL
if [[ -n "$1" ]]; then
  URL=${1}
else
  echo "${GREEN}ReInvent Session URL >>${NOCOLOR}"
  read URL
fi

## Ask for Filename
if [[ -n "$2" ]]; then
  FILENAME=${2}
else
  echo "${GREEN}Filename? (no extension needed) >>${NOCOLOR}"
  read FILENAME
fi




## ---------------
## Magic
## ---------------
## Grabbing URL Data
echo "${YELLOW}\nGrabbing Stream Data...${NOCOLOR}"

STREAM_ID=${URL##*/}
echo "${CYAN}- STREAM ID: ${STREAM_ID}${NOCOLOR}"

PARTNER_ID="3047232"
echo "${CYAN}- PARTNER_ID: ${PARTNER_ID}${NOCOLOR}"

echo "${CYAN}- FILENAME: '${FILENAME}.mp4'${NOCOLOR}"


## Download stream
echo "${YELLOW}\nDownloading Stream...${NOCOLOR}"
streamlink -o ${FILENAME}.ts https://play.virtual.awsevents.com/hlsm/p/${PARTNER_ID}/sp/${PARTNER_ID}00/serveFlavor/entryId/${STREAM_ID}/master.m3u8 best --hls-live-restart \
|| { echo "${RED}ERROR: There was an issue with URL.${NOCOLOR}" 1>&2 ; exit 1; }


## Convert stream to MP4
echo "${YELLOW}\nConverting Stream to MP4...${NOCOLOR}"
ffmpeg -i ${FILENAME}.ts -c copy ${FILENAME}.mp4 -v quiet -stats \
|| { echo "${RED}ERROR: There was an issue converting the stream file to an MP4.${NOCOLOR}" 1>&2 ; exit 1; }


## Delete original stream file
rm ${FILENAME}.ts \
|| { echo "${RED}ERROR: There was an issue deleting the stream file.${NOCOLOR}" 1>&2 ; exit 1; }


## Output save location
echo "${YELLOW}\nFile saved to:${NOCOLOR}"
echo "${CYAN}${PWD}/${FILENAME}.mp4${NOCOLOR}"


## Finish
echo "${GREEN}\nDone${NOCOLOR}"