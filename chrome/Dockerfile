# Pull base image.
FROM pawelkorus/base-gui-app

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/ \
    && dpkg -i /tmp/google-chrome-stable_current_amd64.deb || true \
    && apt-get install -fy --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/*
    
# see https://github.com/jlesage/docker-baseimage-gui#environment-variables
ENV APP_NAME="Chrome"

# if this is set to 1 chrome will run in sandbox mode. If you want to run in sandbox mode you
# need to run docker container in privileded mode (docker run --privilege)
ENV ENABLE_SANDBOX_MODE=0

VOLUME /config

# Copy the start script.
COPY rootfs /
