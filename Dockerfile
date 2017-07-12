FROM node:alpine
MAINTAINER Jefferson Souza <hsinfo@gmail.com>

ENV ANDROID_SDK_VERSION android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_APIS android-19,android-21,android-22,android-23,android-24,android-25
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV ANDROID_BUILD_TOOLS_VERSION 25.0.2

RUN apk update && apk add openjdk8 && \
    npm install -g ionic cordova && \
    echo y | cordova -v && \
    mkdir /opt
ADD https://dl.google.com/android/${ANDROID_SDK_VERSION} /opt

RUN echo y | android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION} --no-https && \
    rm /var/cache/apk/*%
