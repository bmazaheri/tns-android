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

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;27.0.3"
RUN ${ANDROID_HOME}/tools/bin/sdkmanager "platforms;android-27"
RUN ${ANDROID_HOME}/tools/bin/sdkmanager "extras;android;m2repository"
extras;android;m2repository 

VOLUME ["/app","/dist"]

WORKDIR /app
