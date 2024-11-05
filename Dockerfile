# Based on: https://github.com/ebassi/flathub-docker/blob/master/base/Dockerfile

FROM debian:stretch-slim

RUN echo "deb-src http://httpredir.debian.org/debian stretch main" >> /etc/apt/sources.list

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends \
        flatpak \
        git-core \
        locales \
        make && \
        p7zip \
        xmlstarlet \
        bzip2 \
        curl \
        jq \
    rm -rf /usr/share/doc/* /usr/share/man/*

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

COPY flatpak-build.sh /root
RUN chmod +x /root/flatpak-build.sh

RUN /root/flatpak-build.sh

RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
RUN flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo

ENTRYPOINT [ "flatpak-builder" ]