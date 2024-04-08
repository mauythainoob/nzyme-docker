#!/bin/bash
# The conf file uses env vars to allow 
envsubst < /etc/nzyme/nzyme.conf.template > /etc/nzyme/nzyme.conf
/usr/share/nzyme/bin/nzyme 