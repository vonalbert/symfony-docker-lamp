Symfony development environment
==========

Use this as a starting point for building your LAMP stack for symfony.

## Features
- docker / docker-compose
- apache2
- php 7.1
- mysql 5.7
- GNU make

Anyway, as said, is a starting point, so use it to build your environment (using PostgreSQL instead of MySQL, etc...)


## Installation
To deploy this project you only need to get the zip package, cd into it, and then issue `make start`.

At some point, the symfony installation asks to insert the parameters.
You can just use the defaults and you should be fine (with mysql at least).

When the procedure ends, you can browse it at [localhost:8000](http://localhost:8000).

Now you can start to develop your project.

The rest of the project is an out-of-the-box **symfony standard edition**, so to integrate this stack into a 
project of your, you just need to get the `Makefile`, `docker-compose.yml` and the `docker/` directory.
Also take a look at the adjustment done to the `web/app_dev.php` front controller, or you'll get a forbidden error.


## Requirements
Below is a list of requirements to run this project.
- **docker**, tested with `docker 17.05.0-ce` (check your version with `docker -v`)
- **docker-compose**, tested with `docker-compose 1.13.0` (check your version with `docker-compose -v`)
- **GNU Make**, the version used to build the project is `GNU Make 4.1`

On ubuntu you can get the bleeding edge versions of **docker** and **docker-compose** simply issuing
`bin/docker-install.sh`.



## Credits
This project is strongly inspired by [EnMarche website](https://github.com/EnMarche/en-marche.fr/)'s deploy system, where
you can find an excellent implementation of a LEMP stack (I suggest you to take a look there).

The original `docker-install` script is taken from [wdullaer/install.sh](https://gist.github.com/wdullaer/f1af16bd7e970389bad3)
and was included in this package only for convenience. Again, you are **strongly recommended** to go there and get the
updated sources.




