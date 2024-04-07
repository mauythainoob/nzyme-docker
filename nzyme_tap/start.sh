#!/bin/bash
printenv
TAP_SECRET_KEY=TSTnzggmliXnLWQKqcLHxycl2cLbf4IZve0v8f2gPKbSBfCLzp2Wug50SaTrFFGk
if [ -z "$TAP_SECRET_KEY" ]; then
    echo "TAP_SECRET_KEY environment variable is not set or empty. Exiting."
    exit 1
fi

echo "[+] Setting up config."

config_file=/etc/nzyme/nzyme-tap.conf
backup_of_original_config_file=/etc/nzyme/nzyme-tap.conf.backup

# Create a backup of the original config. 
if [ ! -e "$backup_of_original_config_file" ]; then 
    cp $config_file $backup_of_original_config_file
fi 

# We want reset the config to the original because, once we change the default conf files, 
# sed can no longer find them and up new files aren't updated.
cat "$backup_of_original_config_file" > "$config_file"


sed -i "s|your_key_copied_from_nzyme_web_interface|$TAP_SECRET_KEY|" $config_file
sed -i 's!https://nzyme.example.org:22900/!https://0.0.0.0:22900!g' $config_file

cat $config_file

/usr/bin/nzyme-tap --configuration-file /etc/nzyme/nzyme-tap.conf --log-level info