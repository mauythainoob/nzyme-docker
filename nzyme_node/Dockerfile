FROM base_image

# From bake file
ARG PORT
ARG DOWNLOAD_TARGET
# Not from bake file...
ARG NZYME_DEB_FILE=/tmp/nzyme_node_install.deb

# Do this otherwise 'apt install' hangs
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /tmp
RUN apt update && \ 
    apt install -y \ 
        curl \ 
        openjdk-11-jre-headless \ 
        postgresql-client \
        gettext && \
    curl -L ${DOWNLOAD_TARGET} > ${NZYME_DEB_FILE} && \ 
    dpkg -i ${NZYME_DEB_FILE} && \
    # remove file as tmp uses memory and deleting the file frees up image size
    rm ${NZYME_DEB_FILE}
 
WORKDIR /
EXPOSE ${PORT}
CMD ["sh", "/etc/nzyme/start.sh"]
