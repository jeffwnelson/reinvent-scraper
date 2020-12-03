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
./reinvent.sh <session URL> <filename>

./reinvent.sh https://virtual.awsevents.com/media/1_ynpr2pwu "Build a serverless data lake on Amazon S3"
```

Filenames can include spaces, just encapsulate with quotes.