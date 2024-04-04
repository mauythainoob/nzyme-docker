#!/bin/bash
echo "[+] Setting up nzyme-node.";

sed -i 's/YOUR_PASSWORD/mypassword/' /etc/nzyme/nzyme.conf
sed -i 's!https://127.0.0.1:22900!https://0.0.0.0:22900!g' /etc/nzyme/nzyme.conf 
sed -i 's/localhost:5432/postgres:5432/' /etc/nzyme/nzyme.conf 

/usr/share/nzyme/bin/nzyme