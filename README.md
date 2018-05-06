# jinade_squid 

**jinade_squid** is the squid system for all [jinade projects](https://github.com/cretinon/jinade)

## Status
 projects  |  GitHub | Travis | debian_x86_64 | alpine_x86_64 | debian_armhf | alpine_armhf
 ------------  |  ------------ | ------------ | ------------ | ------------ | ------------ | ------------
[jinade_squid](https://github.com/cretinon/jinade_squid) | ![](https://img.shields.io/github/last-commit/cretinon/jinade_squid.svg) | ![](https://travis-ci.org/cretinon/jinade_squid.svg?branch=master) | ![](https://images.microbadger.com/badges/image/cretinon/jinade_squid:debian_x86_64.svg)  | ![](https://images.microbadger.com/badges/image/cretinon/jinade_squid:alpine_x86_64.svg) |  ![](https://images.microbadger.com/badges/image/cretinon/jinade_squid:debian_armhf.svg) | ![](https://images.microbadger.com/badges/image/cretinon/jinade_squid:alpine_armhf.svg)

Sources available on [Git Hub](https://github.com/cretinon/jinade_squid) docker images available on [Docker Hub](https://hub.docker.com/r/cretinon/jinade_squid/tags/) and build with [Travis-ci](https://travis-ci.org/cretinon/jinade_squid)
makefile and .travis.yml inspire by [Whoahsquid](https://github.com/woahsquid/)

## Quick setup
### use these images
You can get theses images from dockerhub and use them directly.
Using one of the tag :
* alpine_armhf
* alpine_x86_64
* debian_armhf
* debian_x86_64
```
docker run -it --rm  --name jinade_squid cretinon/jinade_squid:YOURTAG sh
```
### build from sources
See development section. You'll have to clone then build then start
## Development
### clone
To clone this repository :
```
git clone https://github.com/cretinon/jinade_squid.git
cd jinade_squid
```
---
### makefile
---
#### variable

###### DISTRIB
You can choose your prefered distribution between
* debian
* alpine
###### ARCH
You can choose your prefered arch between
* x86_64
* armhf
---
#### command
##### build
build your image with specific DISTRIB and ARCH
```
make ARCH=x86_64 DISTRIB=debian build
```
---
##### start
run your container, detatch it and start service
```
make ARCH=x86_64 DISTRIB=debian start
```
---
##### shell
run your container, open a shell and do not start service
```
make ARCH=x86_64 DISTRIB=debian shell
```
---
##### logs
see your running container logs
```
make logs
```
---
##### rshell
open a remote shell, as root, inside your running container
```
make rshell
```
---
##### restart
restart your container
```
make restart
```
---
##### stop
stop your container
```
make stop
```
---
##### rm
remove your container (will stop it before)
```
make rm
```
---
##### clean
delete your container's image
```
make clean
```
---
##### all
build and start your container
```
make ARCH=x86_64 DISTRIB=debian all
```
---
##### travis specific commands
* pull
* push
* test
##### build specific commands
* regbinfmt
* fetch
* fetchqemu
---
##### new service / new project
Pre requisite :
* docker hub account
* github account
* travis account (need your travis token)
* modify current makefile in order to change usernames and email
In order to create a fresh environment for a new project :
```
make new_svc_pass new_svc_create NEW_SVC=squid NEW_OPSYS=YOUR_OPSYS
# Enter DOCKER_PASS : changeme
# Enter GITHUB_PASS : whynot
# Enter TRAVIS_TOKEN : 123
cd ../YOUR_OPSYS_squid/
make svc_first_push
```
---

![copyleft](https://upload.wikimedia.org/wikipedia/commons/c/c4/License_icon-copyleft-88x31.svg)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fcretinon%2Fjinade_squid.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fcretinon%2Fjinade_squid?ref=badge_shield)
 [copyleft ](https://www.gnu.org/licenses/copyleft.html) licence


[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fcretinon%2Fjinade_squid.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fcretinon%2Fjinade_squid?ref=badge_large)