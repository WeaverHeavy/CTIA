MISP Docker
===========

The files in this repository are used to create a Docker container running a [MISP](http://www.misp-project.org) ("Malware Information Sharing Platform") instance.

This image is based on the work of https://github.com/MISP/misp-docker. The image was adapted to better suit the requirements of Podictive. 
Specifically, the following things have changed:
* the Dockerfile was simplified;
* the layers were minimized;
* it is now based on ubuntu:bionic;
* externalized redis;
* removed some unnecessary dependencies;
* ~~create VOLUMEs only on the configuration/storage parts of MISP config.~~ Too complicated, but would like advise on the how-to if someone knows

The MISP container needs at least an external MySQL and Redis container to store the data. By default it listen to port 80. I highly recommend to serve it behind a NGinx or Apache reverse proxy.

The build is based on Ubuntu and will install all the required components. The following configuration steps are performed automatically:
* Reconfiguration of the base URL in `config.php`
* ~~Generation of a new salt in `config.php`~~
* Generation of a self-signed certificate
* Optimization of the PHP environment (php.ini) to match the MISP recommended values
* Creation of the MySQL database
* ~~Generation of the admin PGP key~~

The following steps will have to be done manually once inside production:
* Change the configuration to suit your needs
* Generate your own ./gpg keys;
    `sudo gpg --homedir ./gpg/ --gen-key && sudo chown -R www-data:www-data ./gpg/`

**The use of this image is only recommended if you're comfortable with MISP, Docker, and are aware of its limitations**

# Building your image

## Fetch files
```
$ git clone https://github.com/podictive/MISP-docker
$ cd MISP-docker
```
## Fix your environment
Edit the docker-compose.yml and change the following environment variables:
* MYSQL_DATABASE
* MYSQL_USER
* MYSQL_PASSWORD
* MYSQL_ROOT_PASSWORD
* Changed the volumes to match your local filesystem

## Build the containers
```
$ docker-compose build
```

## Run containers
```
$ docker-compose up
```

# Errors

## GPG problems

Check, check and recheck:
* The ownership of the ./gpg directory and all its files are www-data:www-data
* The generation of the GPG key was succesful. For me it sometimes failed to generate a private key.
* The correct emailaddress and passphrase was entered in http://localhost/servers/serverSettings/Encryption
