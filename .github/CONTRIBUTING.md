# Contributing to docker-lidarr

Thank you for taking the time to contribute to this project.  
We appreciate all contributions, but please follow the guidelines below to ensure a smooth review process and CI pipeline execution.

---

## Important guidelines (read first)

- Make sure all changes are completed before opening a Pull Request.  
  Our CI pipeline builds every commit after the PR is opened.

- Always fill out the Pull Request template completely.

- Do NOT open PRs for simple typos in documentation, code, or README.  
  Instead, open an issue and we will handle it.

- If your PR fixes an existing issue, include:  
  `closes #<issue number>` in the PR description or commit message.

- For discussions and help:
  - Discord server: https://linuxserver.io/discord
  - Dev chat: https://discordapp.com/channels/354974912613449730/757585807061155840

---

## Repository structure overview

| File | Purpose |
|------|--------|
| `Dockerfile` | AMD64 build definition |
| `Dockerfile.aarch64` | ARM64 build definition |
| `Dockerfile.armhf` | ARM32 build definition |
| `Jenkinsfile` | Auto-generated CI pipeline (DO NOT EDIT) |
| `jenkins-vars.yml` | Build configuration for Jenkins |
| `package_versions.txt` | Generated package inventory |
| `README.md` | Auto-generated documentation (DO NOT EDIT) |
| `readme-vars.yml` | Source file for README generation |

---

## README changes

⚠️ DO NOT edit `README.md` directly.

All README changes must be made in:

https://github.com/linuxserver/docker-lidarr/edit/master/readme-vars.yml

This file is used by the Jenkins build system and documentation generator:

https://docs.linuxserver.io/images/docker-lidarr

---

### Common README variables

| Variable | Description |
|----------|-------------|
| `project_blurb` | Short description shown under the project logo |
| `app_setup_block` | Application setup instructions section |

---

## Container parameters system

All Docker run / compose examples are generated automatically.

Reference variables:
https://github.com/linuxserver/docker-jenkins-builder/blob/master/vars/_container-vars-blank

---

## Dockerfiles

We use multiple Dockerfiles because different CPU architectures require different packages.

If you modify dependencies, ensure changes are applied consistently across all Dockerfiles in alphabetical order.

---

### Testing your changes locally

```bash
git clone https://github.com/linuxserver/docker-lidarr.git
cd docker-lidarr

docker build \
  --no-cache \
  --pull \
  -t linuxserver/lidarr:latest .