[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://github.com/lidarr/Lidarr
[hub]: https://hub.docker.com/r/linuxserver/lidarr/


[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png?v=4&s=4000)][linuxserverurl]


## Contact information:-

| Type | Address/Details |
| :---: | --- |
| Discord | [Discord](https://discord.gg/YWrKVTn) |
| Forum | [Linuserver.io forum][forumurl] |
| IRC | freenode at `#linuxserver.io` more information at:- [IRC][ircurl]
| Podcast | Covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation! [Linuxserver.io Podcast][podcasturl] |


The [LinuxServer.io][linuxserverurl] team brings you another image release featuring :-

 + regular and timely application updates
 + easy user mappings
 + custom base image with s6 overlay
 + weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 + security updates

# linuxserver/lidarr
[![](https://images.microbadger.com/badges/version/linuxserver/lidarr.svg)](https://microbadger.com/images/linuxserver/lidarr "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/lidarr.svg)](https://microbadger.com/images/linuxserver/lidarr "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/lidarr.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/lidarr.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-lidarr)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-lidarr/)

Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

[![lidarr](https://github.com/lidarr/Lidarr/blob/develop/Logo/400.png)][appurl]

&nbsp;

## Usage

```
docker create \
  --name=lidarr \
  -v <path to data>:/config \
  -v <path to downloads>:/downloads \
  -v <path to music>:/music \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 8686:8686 \
  linuxserver/lidarr
```

&nbsp;

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.



| Parameter | Function |
| :---: | --- |
| `-p 8686` | the port(s) |
| `-v /config` | Contains your config files|
| `-v /downloads` | Path to your download folder for music |
| `-v /music` | Path to your music library |
| `-e PGID` | for GroupID, see below for explanation |
| `-e PUID` | for UserID, see below for explanation |

&nbsp;

## User / Group Identifiers

Sometimes when using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and it will "just work" &trade;.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

&nbsp;

## Setting up the application

Access the webui at `<your-ip>:8686`, for more information check out [Lidarr][appurl].

&nbsp;

## Container access and information.

| Function | Command |
| :--- | :--- |
| Shell access (live container) | `docker exec -it lidarr /bin/bash` |
| Realtime container logs | `docker logs -f lidarr` |
| Container version number | `docker inspect -f '{{ index .Config.Labels "build_version" }}' lidarr` |
| Image version number |  `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/lidarr` |

&nbsp;

## Versions

|  Date | Changes |
| :---: | --- |
| 26.01.19 |  Add pipeline logic and multi arch. |
| 22.04.18 |  Switch to beta builds. |
| 17.03.18 |  Add ENV XDG_CONFIG_HOME="/config/xdg" to Dockerfile for signalr fix. |
| 27.02.18 |  Use json to query for new version. |
| 23.02.18 |  Initial Release. |
