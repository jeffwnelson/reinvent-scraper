RE:Invent 2020 Stream Scraper
==============================

Just a quick bash script to help download these streams for offline viewing.

#### Dependencies
The following packages are needed:
 - curl
 - ffmpeg
 - streamlink

If using BREW:
```
brew install curl ffmpeg streamlink
```

#### Usage

```
./reinvent.sh <m3u8 url> <filename>
```

Locate M3U8 URL by visiting desired AWSEVENTS video, opening console and inspecting "Network" for ".m3u8" files. This script will attempt to use a "master.m3u8" file to pull the stream from and ensure the best quality of video is downloaded.


Filenames can include spaces, just encapsulate with quotes.

