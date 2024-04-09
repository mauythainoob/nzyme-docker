#!/bin/bash
if [ -z "$TAP_SECRET_KEY" ]; then
    echo "TAP_SECRET_KEY environment variable is not set or empty. Exiting."
    exit 1
fi

echo "---------- Starting nzyme tap -----------"

config_file=/etc/nzyme/nzyme-tap.conf
envsubst < /etc/nzyme/nzyme-tap.conf.template > $config_file

# # Check if the montap interface does not exist
# if ! ip link show montap > /dev/null 2>&1; then
#     # If montap doesn't exist, proceed with the setup
#     ip link set dev wlan1 down
#     ip link set wlan1 name montap
#     iw dev montap interface add wlan1 type managed

#     ip link set dev montap down
#     iw dev montap set type monitor
#     ip link set dev montap up
# else
#     echo "The montap interface already exists. No changes made."
# fi

/usr/bin/nzyme-tap --configuration-file $config_file --log-level $LOG_LEVEL