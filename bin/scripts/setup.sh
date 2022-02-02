#!/bin/sh

set -e
env_var_ip_address=0.0.0.0
rake db:drop
RAILS_ENV=production bundle exec rake db:setup
bin/rails server -b ${env_var_ip_address}