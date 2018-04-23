FROM golang:1.9-stretch
LABEL maintainer="Booker Software"

# Environment variables
ENV EMBER_VERSION 3.0.0
ENV APP_DIR /app

# Install some necessary tools
RUN apt-get update -qqy && \
  apt-get -qqy install xvfb fluxbox x11vnc dbus  \
  fontconfig \
  curl \
  gnupg wget ca-certificates apt-transport-https && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qqy && \
  apt-get -qqy install google-chrome-unstable && \
  ln -s /usr/bin/nodejs /usr/bin/node && \
  npm install bower ember-cli@$EMBER_VERSION -g && \
  mkdir $APP_DIR && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
WORKDIR $APP_DIR
VOLUME [$APP_DIR]

CMD ["/entrypoint.sh"]
