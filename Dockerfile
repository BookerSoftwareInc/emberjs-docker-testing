FROM node:10.17.0-stretch
LABEL maintainer="Booker Software"

# Environment variables
ENV APP_DIR /app

# Install some necessary tools
RUN apt-get update -qqy && \
  apt-get -qqy install xvfb fluxbox x11vnc dbus  \
  fontconfig \
  curl \
  gnupg wget ca-certificates apt-transport-https && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update -qqy && \
  apt-get -qqy install google-chrome-unstable && \
  ln -s /usr/bin/nodejs /usr/bin/node && \
  npm install bower ember-cli -g && \
  mkdir $APP_DIR && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
WORKDIR $APP_DIR
VOLUME [$APP_DIR]

CMD ["/entrypoint.sh"]
