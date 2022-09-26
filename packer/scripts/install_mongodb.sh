#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt install -y apt-transport-https ca-certificates
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
systemctl status mongod
if [ $? -eq 0 ]; then
  echo "mongodb installed"
else
  echo "FAILED mongodb install"
fi
