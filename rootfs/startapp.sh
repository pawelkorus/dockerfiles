#!/bin/sh

# Treat unset variables as an error.
set -u

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

export HOME=/config
export PULSE_RUNTIME_DIR=$HOME/pulse-runtime

if [ -e /tmp/.pulse-socket ];
then
    export PULSE_SERVER=/tmp/.pulse-socket
fi

if [ $ENABLE_SANDBOX_MODE -eq 1 ];
then
    google-chrome
else
    google-chrome --no-sandbox
fi

echo -e "${lpurp}Exiting! Goodbye${NC}"
exit 0
