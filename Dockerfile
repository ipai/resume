FROM texlive/texlive:latest

RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security stable-security main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -qyf poppler-utils
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
