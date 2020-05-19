# Dockerize SSH

A Docker Image to SSH into a Remote Container. A container itself is theoretical purposed to run a single process. If a user wants to extend to use multiple process it would be recommended to use a process manager such as supervisord. This repository provides a Dockerfile that builds an image that has `sshd` and `apache2` running simultaneously.

Build Instructions:

* Build Docker Image

```
    docker build --build-arg PASSWORD=<password> -t ssh:latest .
```
* Push Image to a container image repository:

```
    docker image ssh:latest <repo>/ssh:latest
```