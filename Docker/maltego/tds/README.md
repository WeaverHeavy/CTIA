##NOTE: fig has been depricated by docker-compose, consider converting docker-file or building new image.


maltego-tds-docker
============

## Synopsis

Docker configuration for containers that service TDS transforms for Paterva's
Maltego iTDS server.

## Motivation

The [Maltego iTDS Server](https://www.paterva.com/web6/products/servers.php)
provides enterprises and groups of users the ability to share transform libraries
with minimal local configuration on analysts' workstation. Paterva provides a
[Developer Portal](http://dev.paterva.com/developer/) for help developing
transforms, both in local and remote contexts.

The challenge with iTDS is that it requires another server to serve up the
transform code.  The iTDS server mainly acts as a broker for the transforms.
The 2 primary remote transform API's,
[TRX](http://dev.paterva.com/developer/downloads/TRX_documentation20150217.pdf)
and [Canari](http://www.canariproject.com/canari-a-quick-introduction/),
have different ways of serving up their transform content.

[Docker](https://www.docker.com/) provides a lightweight, highly performant
means of provisioning containers for software.  
This is ideally suited for quickly provisioning both development instances,
as well as fully functional and performant production instances.

This project aims to create canonical docker containers for serving TRX and
Canari transforms to iTDS.  The first phase is Canari, then TRX.

1. **canari_twisted**: a docker container serving canari's twisted module, plume

## Installation

### DockerHub
The docker containers are available on [DockerHub](https://registry.hub.docker.com/u/asealey/maltego-tds-canari/).
Installation is as simple as:

`docker pull asealey/maltego-tds-canari`

### Manual
1. Install Docker
<!--- Expand --->
1. Install Fig
<!--- Expand --->
1. Build Images
<!--- Expand --->
1. Start containers (using fig)
<!--- Expand --->

## Contributors

* Adam Sealey
 * <asealey@gmail.com>
 * [@AdamSealey](https://twitter.com/adamsealey)

## License

This work is licensed under [GPLv3](https://www.gnu.org/licenses/quick-guide-gplv3.html).
