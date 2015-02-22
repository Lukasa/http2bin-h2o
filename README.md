# http2bin-h2o

This repository contains the files used by the h2o reverse proxy for http2bin.org.

## How To Use

To get started, build a docker image from the Dockerfile contained in this repository. Then, link it to another running docker container that is exposing a web service on port 8080, giving that link the alias `server`. h2o should immediately begin serving on ports 80 and 443.

If you want to use a non-self-signed SSL cert, replace `server.crt` and `server.key` with your chosen certificates before you build the docker image.
