FROM node:19.2-bullseye-slim
LABEL maintainer="Booker Software"

# Environment variables
ENV APP_DIR /app

# Install some necessary tools
RUN apt-get update -qqy && \
  apt-get -qqy install xvfb fluxbox x11vnc dbus  \
  fontconfig \
  curl \
  python-dev \
  gnupg wget ca-certificates apt-transport-https && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  echo "deb http://ftp.debian.org/debian bullseye-backports main" >> /etc/apt/sources.list && apt-get update && \
  apt-get update -qqy && \
  apt-get -qqy install -t bullseye-backports curl && \
  apt-get -qqy install google-chrome-unstable && \
  ln -s /usr/bin/nodejs /usr/bin/node && \
  npm install ember-cli -g && \
  mkdir $APP_DIR && \
  rm -rf /var/lib/apt/lists/* && \
  git clone https://github.com/facebook/watchman.git && \
  cd watchman && \
  git checkout v4.9.0 && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install

COPY entrypoint.sh /entrypoint.sh
WORKDIR $APP_DIR
VOLUME [$APP_DIR]

CMD ["/entrypoint.sh"]
