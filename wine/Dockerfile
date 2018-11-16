FROM pawelkorus/base-gui-app

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine \
    && rm -rf /var/lib/apt/lists/*