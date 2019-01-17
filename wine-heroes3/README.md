# Heroes 3 wine image

This image is tested with GOG version of Heroes 3 Complete. Before you can start containers from this image you need to have Heroes 3 setup executable.

## Building

In order to build this image run:
```
docker build --rm -t pawelkorus/wine-heroes3 .
```

## Running

Before running this container make sure that all executables are present in directory mounted as `/config` volume. By default, container init script looks for two executables:
1. setup_homm3_complete_2.0.0.16.exe (required)
2. patch_homm3_complete_2.0.1.17.exe (optional)
 
In case game is not installed in directory mounted as `/config` volume setup executables are executed first. Open vnc client and follow instuctions on screen as setup process is manual. You shouldn't change any default values during setup, just click next button.

Basic run command that exposes http vnc client on port 5800:
```
docker run --rm -it --device /dev/snd -v<data_directory>:/config -p 5800:5800 pawelkorus/wine-heroes3
```

In case you want to connect using vnc client you need to expose port 5900:
```
docker run --rm -it --device /dev/snd -v<data_directory>:/config -p 5900:5900 pawelkorus/wine-heroes3

In case audio group ids are different between host and guest machines
you should pass host audio group id using `AUDIO_GROUP_ID`:
```
docker run --rm -it --device /dev/snd -v <data_directory>:/config -p 5800:5800 -e AUDIO_GROUP_ID=<host_-_audio_group_id> pawelkorus/wine-heroes3
```
