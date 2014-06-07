#!/bin/bash
set -e
sudo sh -c "echo starting"
git pull
bundle --deployment
rake db:migrate RAILS_ENV='production'
rake assets:precompile RAILS_ENV='production'
sudo /etc/init.d/nginx restart
