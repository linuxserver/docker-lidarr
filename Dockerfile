FROM lsiobase/mono

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# package versions
ARG LIDARR_VER="develop.0.2.0.224"

RUN \
 echo "**** install lidarr ****" && \
 mkdir -p /app/lidarr && \
 curl -o \
 /tmp/lidarr.tar.gz \
	-L "https://ci.appveyor.com/api/buildjobs/32mn5y508u357fke/artifacts/Lidarr.${LIDARR_VER}.linux.tar.gz" && \
 tar xf \
 /tmp/lidarr.tar.gz -C \
	/app/lidarr --strip-components=1 && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8686
VOLUME /config /downloads /music
