FROM lsiobase/mono:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ARG LIDARR_BRANCH="nightly"

RUN \
 echo "**** install jq ****" && \
 apt-get update && \
 apt-get install -y \
	jq && \
 echo "**** install lidarr ****" && \
 mkdir -p /app/lidarr && \
 lidarr_url=$(curl "https://services.lidarr.audio/v1/update/${LIDARR_BRANCH}/changes?os=linux" \
	| jq -r '.[0].url') && \
  curl -o \
 /tmp/lidarr.tar.gz -L \
	"${lidarr_url}" && \
 tar ixzf \
 /tmp/lidarr.tar.gz -C \
	/app/lidarr --strip-components=1 && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8686
VOLUME /config /downloads /music
