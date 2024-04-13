FROM base_image

# From bake file
ARG DOWNLOAD_TARGET

ARG NZYME_DEB_FILE=/tmp/nzyme_tap_install.deb

# Do this otherwise 'apt install' hangs
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /tmp

# Setup
RUN apt update && \ 
    apt install -y \
        # NOTE: If libcap2-bin isn't on top of this list is can't be found...
        # I don't know why but I do just know
        libcap2-bin \
        curl \ 
        openjdk-11-jre-headless \ 
        libpcap0.8 \ 
        gettext \
        # NOTE: We install this for the nzyme-tap --generate-channels option
        iw && \
    curl -L ${DOWNLOAD_TARGET} > ${NZYME_DEB_FILE} && \ 
    dpkg -i ${NZYME_DEB_FILE} && \
    # remove file as tmp uses memory and deleting the file frees up image size
    rm ${NZYME_DEB_FILE}

# Create nzyme user and change all relvant files to be owned by nzyme 
RUN useradd -m nzyme && \
    chown -R nzyme:nzyme /etc/nzyme/ && \
    chmod -R 700 /etc/nzyme/ && \
    chown nzyme:nzyme /usr/bin/nzyme-tap && \
    # TODO: Figure which only ones we need
    setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nzyme-tap

# Uninstall stuff we no longer need
RUN apt purge -y curl libcap2-bin && \
    apt clean

USER nzyme
WORKDIR /
CMD ["sh", "/etc/nzyme/start.sh"]