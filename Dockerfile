FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN apt-get -y install gnupg --no-install-recommends

ENV PATH                    ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV JAVA_HOME               /usr/lib/jvm/java-8-openjdk-amd64

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get update && \
    apt-get -y install nodejs --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

RUN npm install -g nativescript

#RUN tns error-reporting disable

VOLUME ["/app","/dist"]

WORKDIR /app
