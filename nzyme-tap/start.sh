#!/bin/bash
if [ -z "$TAP_SECRET_KEY" ]; then
    echo "TAP_SECRET_KEY environment variable is not set or empty. Exiting."
    exit 1
fi

echo "[+] Setting up config."

config_file=/etc/nzyme/nzyme.conf

sed -i 's/your_key_copied_from_nzyme_web_interface/$TAP_SECRET_KEY/' $config_file
sed -i 's!https://nzyme.example.org:22900/!https://0.0.0.0:22900!g' $config_file

cat $config_file

/usr/share/nzyme/bin/nzyme