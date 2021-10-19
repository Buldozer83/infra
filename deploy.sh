#~/bin/bash
git clone https://github.com/Artemkin/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
