#! /bin/bash

wget --no-check-certificate https://raw.githubusercontent.com/haxxxer/ci_tool/main/ci
wget --no-check-certificate https://raw.githubusercontent.com/haxxxer/ci_tool/main/readme
apt-get install xclip
mv ci /usr/local/bin/
chmod +x /usr/local/bin/ci
