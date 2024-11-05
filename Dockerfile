# Based on: https://github.com/flatpak/flatpak-docker-images/blob/master/Dockerfile

FROM fedora:41
VOLUME /build
WORKDIR /build
ENV FLATPAK_GL_DRIVERS=dummy
RUN dnf -y update && \
    dnf install -y flatpak-builder ostree fuse elfutils dconf git bzr p7zip xmlstarlet bzip2 curl jq && \
    dnf clean all

RUN flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

# Set default command (optional, for testing purposes)
ENTRYPOINT [ "flatpak-builder" ]