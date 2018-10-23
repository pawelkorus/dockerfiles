# Pull base image.
FROM jlesage/baseimage-gui:debian-9

RUN apt-get update \
    && apt-get install -yq dirmngr --install-recommends
    
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EFDC8610341D9410 \
    && echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list \
    && apt-get update
    
RUN apt-get install wget -yq

RUN wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u9_amd64.deb \
    && apt install -yq ./libssl1.0.0_1.0.1t-1+deb8u9_amd64.deb
    
RUN apt-get install --allow-unauthenticated -yq spotify-client

#pulseaudio
RUN apt-get install -yq libasound2 libasound2-plugins alsa-utils alsa-oss pulseaudio pulseaudio-utils

RUN apt-get install -y ca-certificates

#chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/ \
    && dpkg -i /tmp/google-chrome-stable_current_amd64.deb || true \
    && apt-get install -fy

# see https://github.com/jlesage/docker-baseimage-gui#environment-variables
ENV KEEP_APP_RUNNING=1
ENV APP_NAME="Spotify"
ENV SUP_GROUP_IDS=29

VOLUME /config

# Copy the start script.
COPY rootfs /
