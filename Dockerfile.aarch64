FROM lsiobase/mono:arm64v8-bionic

# set version label
ARG BUILD_DATE
ARG VERSION
ARG LIDARR_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ARG LIDARR_BRANCH="develop"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install --no-install-recommends -y \
        libchromaprint-tools \
        jq && \
 echo "**** install lidarr ****" && \
 mkdir -p /app/lidarr && \
 if [ -z ${LIDARR_RELEASE+x} ]; then \
	LIDARR_RELEASE=$(curl -sL "https://services.lidarr.audio/v1/update/${LIDARR_BRANCH}/changes?os=linux" \
	| jq -r '.[0].version'); \
 fi && \
 lidarr_url=$(curl -sL "https://services.lidarr.audio/v1/update/${LIDARR_BRANCH}/changes?os=linux" \
	| jq -r "first(.[] | select(.version == \"${LIDARR_RELEASE}\")) | .url") && \
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
