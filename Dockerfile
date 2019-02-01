FROM ubuntu:18.04

MAINTAINER ImNotAvirus

WORKDIR /app

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install wget software-properties-common -y && \
    wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    apt-key add winehq.key && \
    wget -nc https://dl.winehq.org/wine-builds/Release.key && \
    apt-key add Release.key && \
    apt-add-repository 'deb http://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
    apt-get update && \
    apt-get -o Dpkg::Options::="--force-overwrite" install --reinstall libsane1:i386 -y && \
    apt-get install --install-recommends winehq-staging -y && \
    apt-get purge -y software-properties-common && \
    apt-get autoclean -y

COPY res/2018-03-21_Nostale_FR_Setup.exe nostale.exe

ENTRYPOINT ["/bin/bash"]

