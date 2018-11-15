#!/usr/bin/with-contenv sh

#
# Updates audio group id so that it matches host audio group id.
# This is requires in order to play sound with /dev/snd
#

if [ "${AUDIO_GROUP_ID:-UNSET}" != "UNSET" ]; then
    echo "Changing audio group id to $AUDIO_GROUP_ID"
    groupmod -g $AUDIO_GROUP_ID audio

    echo "Adding audio group id ${AUDIO_GROUP_ID} to SUP_GROUP_IDS=${SUP_GROUP_IDS}"
    if [ "${SUP_GROUP_IDS:-UNSET}" = "UNSET" ]; then
        echo $AUDIO_GROUP_ID > /var/run/s6/container_environment/SUP_GROUP_IDS
    else 
        echo $SUP_GROUP_IDS,$AUDIO_GROUP_ID > /var/run/s6/container_environment/SUP_GROUP_IDS
    fi
fi