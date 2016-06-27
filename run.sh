#!/bin/bash

if [ -f /tmp/Jekyll/Gemfile ]; then
  bundle install --binstubs --path=vendor
fi

jekyll
