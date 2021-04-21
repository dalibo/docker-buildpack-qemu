FROM debian:bullseye

ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /usr/local/bin/
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini /usr/local/sbin/tini

RUN set -ex; \
    chmod +x /usr/local/bin/wait-for-it.sh; \
    chmod +x /usr/local/sbin/tini; \
    :

RUN set -ex; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cpio \
        git \
        libguestfs-tools \
        linux-image-cloud-amd64 \
        lsb-release \
        make \
        packer \
        qemu-system-x86 \
        sudo \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    :

ENTRYPOINT ["/usr/local/sbin/tini", "-gw", "--"]
