# Container collections

A collection of containers to build more specialised containers.

Why Container collections? All containers in this repository are generic containers, i.e. they provide a consistent starting point to build more specialized containers for all kinds of applications. This collection follows the idea of a `Software Collection`, as implemented in the [Software Collections](https://github.com/sclorg) repository. The [sclorg/welcome](https://github.com/sclorg/welcome) page provides a detailled overview of the concept.

## Repository Overview

* [base-container](base-container/README.md): Basic container image based on [Red Hat's Universal Base Images](https://catalog.redhat.com/software/containers/search).
* [base-golang](base-golang/README.md): Golang s2i image to build and run microservices.

## Base Images

* [Red Hat Universal Base Image 8](https://catalog.redhat.com/software/containers/ubi8/ubi/5c359854d70cc534b3a3784e)
* [s2i base](https://catalog.redhat.com/software/containers/ubi8/s2i-base/5c83976a5a13464733ec6790)

The source code for most of the base- and s2i images can be found in the [Software Collections](https://github.com/sclorg) repo.

## Build locally

To build the container images locally, make sure you have [Podman]() installed and running. 

Start the build with:

```shell
make build-all
```

## Build on OpenShift

To build the container images on Red Hat OpenShift, make sure that the OpenShift command line utility `oc` is installed and that you are logged into the OpenShift cluster.

Start the build with:

```shell
make build-all-openshift
```

This creates a dedicated project/namespace to run the builds in and deploys the build configurations into the namespace. The image streams are created in the `openshift` namespace. 

To verify that the builds are running:

```shell
oc get builds -n ccolletions
```
