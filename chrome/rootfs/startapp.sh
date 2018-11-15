#!/bin/sh

# Treat unset variables as an error.
set -u

export HOME=/config

if [ $ENABLE_SANDBOX_MODE -eq 1 ];
then
    google-chrome
else
    google-chrome --no-sandbox
fi

echo -e "Exiting! Goodbye"
exit 0
