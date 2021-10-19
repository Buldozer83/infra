#!/bin/bash
set -e
cd ~
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd ~/reddit
bundle install
mv /tmp/puma.service /etc/systemd/system/puma.service
systemctl daemon-reload
systemctl start puma
systemctl enable puma
systemctl status puma


#set -e
#git clone https://github.com/Otus-DevOps-2017-11/reddit.git
#cd ~/reddit
#source ~/.rvm/scripts/rvm
#rvm requirements
#rvm install 2.4.1
#rvm use 2.4.1 --default
#bundle install
#puma -d

#sudo mv /tmp/puma-server.service /etc/systemd/system/
#sudo systemctl enable puma-server.service
