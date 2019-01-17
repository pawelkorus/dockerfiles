#!/usr/bin/env sh

# Treat unset variables as an error.
set -u

export HOME=/config
export C_DRIVE=$HOME/.wine/drive_c
export HEROES3_DIR=$C_DRIVE/GOG\ Games/Heroes\ of\ Might\ and\ Magic\ 3\ Complete/

cd $HOME

if ! [ -e "$HEROES3_DIR" ]; 
then
    if [ -e $SETUP_FILE ];
    then
        echo "Installing Heroes 3 Complete."
        wine $SETUP_FILE
    else
        echo "Can't find Heroes 3 setup executable: $SETUP_FILE. Exiting."
        exit 0;
    fi

    if [ -e $PATCH_FILE ];
    then
        echo "Installing Heroes 3 Complete Patch."
        wine $PATCH_FILE
    else
        echo "Can't find Heroes 3 patch setup executable: $PATCH_FILE. Skipping patch installation."
    fi

    # Don't use DISPLAY_WIDTH and DISPLAY_HEIGHT environment variables (see https://github.com/jlesage/docker-baseimage-gui)
    # to limit Heroes 3 window. This will work, but there are some problems with mouse pointer after game is running 
    # for few minutes.
    winecfg
fi

echo "Running Hereos 3 complete."

cd "$HEROES3_DIR"
wine Heroes3.exe