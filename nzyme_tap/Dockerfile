FROM base_image

# From bake file
ARG DOWNLOAD_TARGET

ARG NZYME_DEB_FILE=/tmp/nzyme_tap_install.deb

# Do this otherwise 'apt install' hangs
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /tmp

# TODO: Remove download from /tmp as it uses memory
RUN apt update && \ 
    apt install -y \
        curl \ 
        openjdk-11-jre-headless \ 
        postgresql-client \
        wireless-tools \ 
        procps \
        usbutils \
        libpcap0.8 \ 
        gettext \
        moreutils \
        iproute2 \
        iw && \
    curl -L ${DOWNLOAD_TARGET} > ${NZYME_DEB_FILE} && \ 
    dpkg -i ${NZYME_DEB_FILE} && \
    # remove file as tmp uses memory and deleting the file frees up image size
    rm ${NZYME_DEB_FILE}
 
WORKDIR /
CMD ["sh", "/tmp/start.sh"]