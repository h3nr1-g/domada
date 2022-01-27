# Domada
Docker container for the Omada SDN controller

## Why Domada?
The original deb package of the Omada SDN controller (avialable [here](https://www.tp-link.com/de/support/download/omada-software-controller/)) 
has some wired post install steps which makes it hard to run it on your local machine. Therefore, I deceided to pick the package apart and create
a more handy docker container out of it.

## How to run

### Start container
```bash
docker-compose build
doker-compose up
```

### Open Web UI
```bash
x-www-browser http://127.0.0.1:8088 
```
