FROM base_image

# From bake file
ARG PORT
ARG DOWNLOAD_TARGET
# Not from bake file...
ARG NZYME_DEB_FILE=/tmp/nzyme_node_install.deb

# Do this otherwise 'apt install' hangs
ENV DEBIAN_FRONTEND=noninteractive 

# Setup
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

# Create nzyme user and change all relvant files to be owned by nzyme 
RUN useradd -m nzyme && \
    chown -R nzyme:nzyme /etc/default/nzyme && \
    chmod -R 700 /etc/default/nzyme && \
    chown -R nzyme:nzyme /etc/nzyme/ && \
    chmod -R 700 /etc/nzyme/ && \
    chown -R nzyme:nzyme /etc/nzyme/ && \
    chmod -R 700 /etc/nzyme/ && \
    chown -R nzyme:nzyme /usr/share/nzyme && \
    chmod -R 700 /usr/share/nzyme && \
    chown -R nzyme:nzyme /var/log/nzyme/ && \
    chmod -R 700 /var/log/nzyme/

# Uninstall stuff we no longer need
RUN apt purge -y curl && \
    apt clean 

USER nzyme
WORKDIR /etc/nzyme
EXPOSE ${PORT}
CMD ["sh", "/etc/nzyme/start.sh"]
