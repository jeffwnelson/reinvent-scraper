#!/bin/zsh

## ---------------
## Colors
## ---------------
NOCOLOR='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

## Ask for URL
if [[ -n "$1" ]]; then
  URL=${1}
else
  echo "${GREEN}ReInvent Session URL${NOCOLOR}"
  read URL
fi

## Ask for Filename
if [[ -n "$2" ]]; then
  FILENAME=${2}
else
  echo "${GREEN}Filename? (no extension needed)${NOCOLOR}"
  read FILENAME
fi

## Magic
## Grabbing URL Data
STREAM_ID=${URL##*/}
PARTNER_ID="3047232"

## Download stream
echo "${YELLOW}Downloading Stream...${NOCOLOR}"
streamlink -o ${FILENAME}.ts https://play.virtual.awsevents.com/hlsm/p/${PARTNER_ID}/sp/${PARTNER_ID}00/serveFlavor/entryId/${STREAM_ID}/master.m3u8 best --hls-live-restart

## Convert stream to MP4
echo "${YELLOW}Converting Stream to MP4...${NOCOLOR}"
ffmpeg -i ${FILENAME}.ts -c copy ${FILENAME}.mp4

## Delete original stream file
rm ${FILENAME}.ts

echo "${YELLOW}Done.${NOCOLOR}"
