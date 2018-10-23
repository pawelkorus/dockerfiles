# Build

`./build.sh`

# Run

Docker needs to be run in privileged mode. Otherwise it is not able to connect to device.

`./run.sh`

# Inside container

## Pulseaudio

when running as non root user keep in mind that you have to export PULSE_RUNTIME_PATH. Otherwise pulse deamon will use /tmp/run/ which is not permitted to normal user.

## Bash as app user

run container with bash: 

`docker run ... spotify /bin/bash`

and then inside container:

`s6-applyuidgid -u 1000 -g 1000 -G 29 bash`

