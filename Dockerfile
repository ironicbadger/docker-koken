FROM lsiobase/alpine.nginx

# install packages
RUN \
  echo "**** install runtime packages ****" && \
  apk add --no-cache \
    curl \
    imagemagick \
    ffmpeg \
    graphicsmagick \
    php7-mysqli \
    php7-curl

RUN mkdir -p /app/koken && \
      curl -o \ 
        /tmp/koken.zip -L \
        "https://s3.amazonaws.com/koken-installer/releases/Koken_Installer.zip" && \
      cd /tmp && \
      unzip koken.zip && \
      rm koken.zip && \
      mv koken/ /app/

COPY /root /