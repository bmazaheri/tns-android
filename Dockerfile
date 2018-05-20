FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get update && \
    apt-get -y install nodejs --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

RUN npm install -g nativescript

#RUN tns error-reporting disable

VOLUME ["/app","/dist"]

WORKDIR /app
