# Pull base image https://github.com/jlesage/docker-baseimage-gui.
FROM jlesage/baseimage-gui:debian-9

RUN apt-get update && apt-get install -yq --no-install-recommends \
    dirmngr \
    wget \
    ca-certificates \
    alsa-utils
    
# Use this to change audio group id so that it is the same as on host machine 
ENV AUDIO_GROUP_ID=

VOLUME /config

# Copy the start script.
COPY rootfs /


