#!/bin/zsh

## ---------------
## Colors
## ---------------
NOCOLOR='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

## Ask for URL
if [[ -n "$1" ]]; then
  m3u8url=${1}
else
  echo "${GREEN}M3U8 URL${NOCOLOR}"
  read m3u8url
fi

## Ask for Filename
if [[ -n "$2" ]]; then
  filename=${2}
else
  echo "${GREEN}Filename? (no extension)${NOCOLOR}"
  read filename
fi

## Magic
echo "${YELLOW}Downloading Stream...${NOCOLOR}"
streamlink -o ${filename}.ts ${m3u8url} best --hls-live-restart
ffmpeg -i ${filename}.ts -c copy ${filename}.mp4
rm ${filename}.ts
echo "${YELLOW}Done.${NOCOLOR}"