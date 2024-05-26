# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.20

# set version label
ARG BUILD_DATE
ARG VERSION
ARG LIDARR_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Roxedus,thespad"

# environment settings
ARG LIDARR_BRANCH="nightly"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
  echo "**** install packages ****" && \
  apk add -U --upgrade --no-cache \
    chromaprint \
    icu-libs \
    sqlite-libs \
    xmlstarlet && \
  echo "**** install lidarr ****" && \
  mkdir -p /app/lidarr/bin && \
  if [ -z ${LIDARR_RELEASE+x} ]; then \
    LIDARR_RELEASE=$(curl -sL "https://lidarr.servarr.com/v1/update/${LIDARR_BRANCH}/changes?runtime=netcore&os=linuxmusl" \
    | jq -r '.[0].version'); \
  fi && \
  curl -o \
  /tmp/lidarr.tar.gz -L \
    "https://lidarr.servarr.com/v1/update/${LIDARR_BRANCH}/updatefile?version=${LIDARR_RELEASE}&os=linuxmusl&runtime=netcore&arch=x64" && \
  tar xzf \
    /tmp/lidarr.tar.gz -C \
    /app/lidarr/bin --strip-components=1 && \
  echo -e "UpdateMethod=docker\nBranch=${LIDARR_BRANCH}\nPackageVersion=${VERSION}\nPackageAuthor=[linuxserver.io](https://www.linuxserver.io/)" > /app/lidarr/package_info && \
  printf "Linuxserver.io version: ${VERSION}\nBuild-date: ${BUILD_DATE}" > /build_version && \
  echo "**** cleanup ****" && \
  rm -rf \
    /app/lidarr/bin/Lidarr.Update \
    /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8686

VOLUME /config
