#!/bin/bash
apt update
pkill apt
apt install -y ruby-full ruby-bundler build-essential
#ruby -v
#ruby_v=$?
#bundler -v
#bundler_v=$?
#if [[ "$ruby_v" -eq 0 ]] && [[ "$bundler_v" -eq 0 ]]; then
if [ $? -eq 0 ]; then
  echo "ruby installed"
else
  echo "FAILED ruby install"
fi
