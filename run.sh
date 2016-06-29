#!/bin/bash

if [ -f /tmp/jekyll/Gemfile ]; then
  cd /tmp/jekyll
  bundle install
fi

bundle exec rake "$@"
