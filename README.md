[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# [linuxserver/lidarr](https://github.com/linuxserver/docker-lidarr)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/lidarr.svg)](https://microbadger.com/images/linuxserver/lidarr "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/lidarr.svg)](https://microbadger.com/images/linuxserver/lidarr "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/lidarr.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/lidarr.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-lidarr/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-lidarr/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/lidarr/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/lidarr/latest/index.html)

[Lidarr](https://github.com/lidarr/Lidarr) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

[![lidarr](https://github.com/lidarr/Lidarr/blob/develop/Logo/400.png)](https://github.com/lidarr/Lidarr)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/). 

Simply pulling `linuxserver/lidarr` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |

## Version Tags

This image provides various versions that are available via tags. `latest` tag usually provides the latest stable version. Others are considered under development and caution must be exercised when using them.

| Tag | Description |
| :----: | --- |
| latest | Stable Lidarr releases. |
| preview | Nightly Lidarr Releases. |

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=lidarr \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=Europe/London \
  -p 8686:8686 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/music>:/music \
  -v </path/to/downloads>:/downloads \
  --restart unless-stopped \
  linuxserver/lidarr
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  lidarr:
    image: linuxserver/lidarr
    container_name: lidarr
    environment:
      - PUID=1001
      - PGID=1001
      - TZ=Europe/London
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/music>:/music
      - </path/to/downloads>:/downloads
    ports:
      - 8686:8686
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8686` | Application WebUI |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-v /config` | Configuration files for Lidarr. |
| `-v /music` | Music files. |
| `-v /downloads` | Path to your download folder for music. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

Access the webui at `<your-ip>:8686`, for more information check out [Lidarr](https://github.com/lidarr/Lidarr).



## Support Info

* Shell access whilst the container is running: `docker exec -it lidarr /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f lidarr`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' lidarr`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/lidarr`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/lidarr`
* Stop the running container: `docker stop lidarr`
* Delete the container: `docker rm lidarr`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start lidarr`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/lidarr`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **26.01.19:** - Add pipeline logic and multi arch.
* **22.04.18:** - Switch to beta builds.
* **17.03.18:** - Add ENV XDG_CONFIG_HOME="/config/xdg" to Dockerfile for signalr fix.
* **27.02.18:** - Use json to query for new version.
* **23.02.18:** - Initial Release.
