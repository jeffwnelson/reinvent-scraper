RE:Invent 2020 Stream Scrapper
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

Locate M3U8 URL by visiting desired AWSEVENTS video, opening console and inspecting "Network" for ".m3u8" files. There is a ".m3u8" file for each stream. (usually several due to player quality options. 1080p/720p, etc...)


Filenames can include spaces, just encapsulate with quotes.

