FROM base_image

ARG DOWNLOAD_TARGET

# Apt install hangs otherwise
ENV DEBIAN_FRONTEND=noninteractive 
ENV NZYME_JAVA_OPTS="-Xms1g -Xmx1g -XX:-OmitStackTraceInFastThrow"

WORKDIR /tmp

# TODO: Remove download from /tmp as it uses memory
RUN apt update && \ 
    apt install -y wget openjdk-11-jre-headless postgresql-client libpcap0.8 && \
    wget ${DOWNLOAD_TARGET} && \ 
    ls | grep '.deb' | xargs dpkg -i
 
# CMD ["sh", "/tmp/start.sh"]

 
