FROM base_image

# From bake file
ARG DOWNLOAD_TARGET

ARG NZYME_DEB_FILE=/tmp/nzyme_tap_install.deb

# Do this otherwise 'apt install' hangs
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /tmp

# TODO: Remove download from /tmp as it uses memory
# RUN apt update && apt install
RUN apt update && \ 
    apt install -y \
        libcap2-bin \
        curl \ 
        openjdk-11-jre-headless \ 
        libpcap0.8 \ 
        gettext \
        iw && \
    curl -L ${DOWNLOAD_TARGET} > ${NZYME_DEB_FILE} && \ 
    dpkg -i ${NZYME_DEB_FILE} && \
    # remove file as tmp uses memory and deleting the file frees up image size
    rm ${NZYME_DEB_FILE}

RUN useradd -m nzyme && \
    chown -R nzyme:nzyme /etc/nzyme/ && \
    chmod -R 700 /etc/nzyme/ && \
    chown nzyme:nzyme /usr/bin/nzyme-tap && \
    setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nzyme-tap

USER nzyme
WORKDIR /
CMD ["sh", "/etc/nzyme/start.sh"]