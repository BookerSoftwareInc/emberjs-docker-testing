# Docker Image for Ember Testing
This Docker image, will setup a system so your ember tests can be executed inside the container itself.

## Supported tags and respective `Dockerfile` links
+ [`latest` (3.0.0/Dockerfile)](https://github.com/BookerSoftwareInc/emberjs-docker-testing/blob/3.0.0/Dockerfile)
+ [`3.0.0` (3.0.0-golang/Dockerfile)](https://github.com/BookerSoftwareInc/emberjs-docker-testing/blob/3.0.0-golang/Dockerfile)
+ [`2.18.2` (2.18.2/Dockerfile)](https://github.com/BookerSoftwareInc/emberjs-docker-testing/blob/2.18.2/Dockerfile)
+ [`2.18.2-golang` (2.18.2-golang/Dockerfile)](https://github.com/BookerSoftwareInc/emberjs-docker-testing/blob/2.18.2-golang/Dockerfile)

## Run the Image

```
docker run --rm -ti -v "$PWD":/app -p 7357:7357 bookerdev/emberjs-docker-testing bash
```

### Run Your Tests
Now that you are in the container, you can run the following command

```
# ember test --server
```