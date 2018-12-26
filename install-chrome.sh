#!/bin/sh
set -ex

#
# Install Google Chrome
#
# https://www.ubuntuupdates.org/ppa/google_chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# Avoid package list duplicates:
#   - Renamed "google.list" with "google-chrome.list".
#   - Replaced ">>" with "sudo tee".
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update 
sudo apt-get install -y google-chrome-stable
