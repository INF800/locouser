FROM debian:stretch-slim

# Hack to get openjdk to install in a container
RUN mkdir -p /usr/share/man/man1 \
    && mkdir -p /usr/share/man/man7

# Apt
RUN apt update && apt install -y curl wget git xz-utils lib32stdc++6 unzip openjdk-8-jdk-headless


# Firefox over VNC
# FROM ubuntu:12.04
# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
RUN bash -c 'echo "firefox" >> /.bashrc'

# Android SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip 
RUN mkdir android-sdk && unzip /sdk-tools-linux-4333796.zip -d android-sdk
RUN rm /sdk-tools-linux-4333796.zip
ENV ANDROID_HOME="/android-sdk"
ENV PATH="/android-sdk/tools/bin:/android-sdk/build-tools:/android-sdk/platform-tools:${PATH}"

# SDK manager
RUN yes | sdkmanager --licenses
RUN sdkmanager "platforms;android-28" "platform-tools" "build-tools;28.0.3"

# Flutter
RUN wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz
RUN tar xf flutter_linux_v1.5.4-hotfix.2-stable.tar.xz 
RUN rm flutter_linux_v1.5.4-hotfix.2-stable.tar.xz
ENV PATH="/flutter/bin:${PATH}"

RUN flutter config --no-analytics

# setup emulator
# `flutter emulators` will list all emulators. use sdk manager to
# create an emulator
# sdkmanager "system-images;android-27;google_apis_playstore;x86"
# apt install libpulse0 -y
# apt install  ffmpeg libsm6 libxext6  -y
# apt install libxcomposite-dev -y

# launch emulator
# flutter emulators --launch pixel

# Set a useful default shell
ENV SHELL /bin/bash