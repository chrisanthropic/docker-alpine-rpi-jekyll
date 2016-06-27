#!/bin/bash

if [ -f /tmp/jekyll/Gemfile ]; then
  bundle install --binstubs --path=vendor
fi

jekyll
