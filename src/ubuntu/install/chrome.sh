#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Chromium Browser"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update
apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg google-chrome-stable
apt-get clean -y
#ln -s /usr/bin/chromium-browser /usr/bin/google-chrome 
### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init
