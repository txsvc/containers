# Container collections

Why Container collections? All coontainers under this repository are *base-line* conatiner, i.e. they provide a consistent starting point to build more specialized containers for all kinds of purposes.

This collection follows the idea of a Software Collections, as implemented in the [sclorg](https://github.com/sclorg) organization. The [sclorg/welcome](https://github.com/sclorg/welcome) page provides a detailled overview of the concept.

## Repository Overview

* [base-container](base-container/README.md): Basic container image based on [Red Hat's Universal Base Images](https://catalog.redhat.com/software/containers/search).
* [base-golang](base-golang/README.md): Golang s2i image to build and run microservices.

## Base Images

* [Red Hat Universal Base Image 8](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e)
* [s2i base](https://catalog.redhat.com/software/containers/ubi8/s2i-base/5c83976a5a13464733ec6790)

The source code for most of the base- and s2i images can be found in the [Software Collections](https://github.com/sclorg) repo.