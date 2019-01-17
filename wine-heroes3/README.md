# Heroes 3 wine image

This image is tested with GOG version of Heroes 3 Complete. Before you can start containers from this image you need to have Heroes 3 setup executable.

## Building

In order to build this image run:
```
docker build --rm -t pawelkorus/wine-heroes3 .
```

## Running

In case game directory is not detected in directory mounted as `/config` volume, container init script looks for setup executables and executes them. Make sure that these files are present in dicrectory mounted as `/config` volume: 
1. setup_homm3_complete_2.0.0.16.exe (required)
2. patch_homm3_complete_2.0.1.17.exe (optional)
After running container for the first time, remember to open vnc client and follow instuctions on screen as setup process is manual. You shouldn't change any default values during setup, just click next button. After game and patch are installed, winecfg will be executed. You need to go to `Graphics` tab and tick `Emulate a virtual desktop`. Resolution should be set to `800x600`.

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
