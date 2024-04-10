#!/bin/bash
if [ -z "$TAP_SECRET_KEY" ]; then
    echo "TAP_SECRET_KEY environment variable is not set or empty. Exiting."
    exit 1
fi

echo "---------- Starting nzyme tap -----------"

config_file=/etc/nzyme/nzyme-tap.conf
envsubst < /etc/nzyme/nzyme-tap.conf.template > $config_file

/usr/bin/nzyme-tap --configuration-file $config_file --log-level $LOG_LEVEL
