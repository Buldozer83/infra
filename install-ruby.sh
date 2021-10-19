#!/bin/bash
curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz
mkdir rvm && cd rvm
tar --strip-components=1 -xzf ../rvm-stable.tar.gz
./install --auto-dotfiles
source ~/.rvm/scripts/rvm
rvm reqirements
rvm install 2.4.1
rvm use 2.4.1 --default
gem install bundler -V --no-ri --no-rdoc
ruby -v
bundle -v

