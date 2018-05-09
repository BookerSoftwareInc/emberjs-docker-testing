#!/bin/sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "======================================="
echo "$dt. Starting container..."

# move on to the work directory
cd $APP_DIR
echo "App dir: $APP_DIR"

echo "Lets make sure your dependencies are installed"

if [ -f bower.json ]; then
  bower install --allow-root & wait
fi

if [ -f yarn.lock ]; then
  yarn install & wait
elif [ -f package-lock.json ]; then
  npm install & wait
else
  yarn install & wait
fi

#echo "Starting chrome for testing"
xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome -start-maximized > /dev/null &

ember test
