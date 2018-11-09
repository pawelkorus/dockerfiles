# Build

In order to build this image run:
```
docker build --rm -t pawelkorus/chrome .
```

# Run

## Simple execution
The simple command to run container:
```
docker run --rm -p 5800:5800 pawelkorus/chrome
```
After some time you can open your browser and use `http://localhost:5800` to ineract with the chrome browser.

## With audio enabled
In order to enable audio, first create pulse audio socket:
```
SPOTIFYSOCKET=`pactl load-module module-native-protocol-unix auth-anonymous=1 socket=/tmp/.docker-pulse-socket`
```

The you can run chrome container using following command
```
docker run --rm -p 5800:5800 -v /tmp/.docker-pulse-socket:/tmp/.pulse-socket pawelkorus/chrome
```

After chrome container has finished you should close the socker:
```
pactl unload-module $SPOTIFYSOCKET
```
# Inside container

## Pulseaudio

when running as non root user keep in mind that you have to export PULSE_RUNTIME_PATH. Otherwise pulse deamon will use /tmp/run/ which is not permitted to normal user.