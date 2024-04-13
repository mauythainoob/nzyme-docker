#!/bin/bash
# The conf file uses env vars to allow 
echo "---------- Starting nzyme node -----------"
envsubst < /etc/nzyme/nzyme.conf.template > /etc/nzyme/nzyme.conf

# Configuration for the heap (see https://docs.nzyme.org/getting-started/installation/ubuntu-server-2204/#configure-nzymeconf)
echo 'NZYME_JAVA_OPTS="-Xms${INITIAL_HEAP_SIZE_IN_GB}g -Xmx${MAX_HEAP_SIZE_IN_GB}g -XX:-OmitStackTraceInFastThrow"' > /etc/default/nzyme

# Use postgres-client to request the keys from the database and then write it
/usr/share/nzyme/bin/nzyme 