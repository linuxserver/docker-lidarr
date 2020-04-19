[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Supporters&logo=open%20collective&logoColor=FFFFFF)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring:

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/lidarr](https://github.com/linuxserver/docker-lidarr)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-lidarr.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-lidarr)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-lidarr.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-lidarr/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub%20Package&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-lidarr/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab&logoColor=FFFFFF)](https://gitlab.com/Linuxserver.io/docker-lidarr/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/lidarr)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/lidarr.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/lidarr "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/lidarr.svg?style=flat-square&color=E68523&label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/lidarr)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/lidarr.svg?style=flat-square&color=E68523&label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/lidarr)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-lidarr/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-lidarr/job/master/)
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
| armhf | arm32v7-latest |

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
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 8686:8686 \
  -v /path/to/appdata/config:/config \
  -v /path/to/music:/music \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/lidarr
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2.1"
services:
  lidarr:
    image: linuxserver/lidarr
    container_name: lidarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - UMASK_SET=022 #optional
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/music:/music
      - /path/to/downloads:/downloads
    ports:
      - 8686:8686
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8686` | Application WebUI |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e UMASK_SET=022` | control permissions of files and directories created by Lidarr. |
| `-v /config` | Configuration files for Lidarr. |
| `-v /music` | Music files (See note in Application setup). |
| `-v /downloads` | Path to your download folder for music (See note in Application setup). |

## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`. 

As an example:

```
-e FILE__PASSWORD=/run/secrets/mysecretpassword
```

Will set the environment variable `PASSWORD` based on the contents of the `/run/secrets/mysecretpassword` file.

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

Access the webui at `<your-ip>:8686`, for more information check out [Lidarr](https://github.com/lidarr/Lidarr).

Special Note: Following our current folder structure will result in an inability to hardlink from your downloads to your Music folder because they are on seperate volumes. To support hardlinking, simply ensure that the Music and downloads data are on a single volume. For example, if you have /mnt/storage/Music and /mnt/storage/downloads/completed/Music, you would want something like /mnt/storage:/media for your volume. Then you can hardlink from /media/downloads/completed to /media/Music.

Another item to keep in mind, is that within lidarr itself, you should then map your torrent client folder to your lidarr folder: Settings -> Download Client -> advanced -> remote path mappings. I input the host of my download client (matches the download client defined) remote path is /downloads/Music (relative to the internal container path) and local path is /media/downloads/completed/Music, assuming you have folders to seperate your downloaded data types.


## Docker Mods
[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?style=for-the-badge&color=E68523&label=mods&query=%24.mods%5B%27lidarr%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=lidarr "view available mods for this container.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) can be accessed via the dynamic badge above.


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
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull lidarr`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d lidarr`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once lidarr
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-lidarr.git
cd docker-lidarr
docker build \
  --no-cache \
  --pull \
  -t linuxserver/lidarr:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **05.04.20:** - Move app to /app.
* **01.08.19:** - Rebase to Linuxserver LTS mono version.
* **13.06.19:** - Add env variable for setting umask.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
* **08.03.19:** - Rebase to Bionic, use proposed endpoint for libchromaprint.
* **26.01.19:** - Add pipeline logic and multi arch.
* **22.04.18:** - Switch to beta builds.
* **17.03.18:** - Add ENV XDG_CONFIG_HOME="/config/xdg" to Dockerfile for signalr fix.
* **27.02.18:** - Use json to query for new version.
* **23.02.18:** - Initial Release.
