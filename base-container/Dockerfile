FROM registry.access.redhat.com/ubi8-minimal:latest

ENV SUMMARY="base image"	\
    DISPLAY_NAME="base image name" \
    DESCRIPTION="base image description"

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="$DISPLAY_NAME"

# the $HOME is not set by default, but some applications needs this variable
ENV APP_ROOT=/opt/app-root \
    DATA_ROOT=/opt/data \
    HOME=/opt/app-root/src \
    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    PLATFORM="el8"

# install basic apps and libs
RUN INSTALL_PKGS="bsdtar \
  findutils \
  glibc-locale-source \
  glibc-langpack-en \
  gettext \
  rsync \
  tar \
  unzip \
  xz \
  wget \
  shadow-utils \
  which" && \
  mkdir -p ${HOME}/.pki/nssdb && \
  chown -R 1001:0 ${HOME}/.pki && \
  microdnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
  rpm -V $INSTALL_PKGS && \
  microdnf -y clean all --enablerepo='*'

# copy extra files to the image.
COPY ./common-scripts/root/ /

# directory with the sources is set as the working directory
WORKDIR ${HOME}

ENTRYPOINT ["container-entrypoint"]
CMD ["base-usage"]

# reset permissions of modified directories and add default user
RUN rpm-file-permissions && \
  useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin \
      -c "default application user" default && \
  chown -R 1001:0 ${APP_ROOT}
