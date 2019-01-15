# Docker chrome image

Image running Google Chrome browser.

## Building

In order to build this image run:
```
docker build --rm -t pawelkorus/chrome .
```

## Running

Basic run command that exposes http vnc client on port 5800:
```
docker run --rm -it --device /dev/snd -v<data_directory>:/config -p 5800:5800 pawelkorus/chrome
```

In case you want to connect using vnc client you need to expose port 5900:
```
docker run --rm -it --device /dev/snd -v<data_directory>:/config -p 5900:5900 pawelkorus/chrome

In case audio group ids are different between host and guest machines
you should pass host audio group id using `AUDIO_GROUP_ID`:
```
docker run --rm -it --device /dev/snd -v <data_directory>:/config -p 5800:5800 -e AUDIO_GROUP_ID=<host_-_audio_group_id> pawelkorus/chrome
```