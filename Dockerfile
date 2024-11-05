# Use Fedora as the base image
FROM fedora:latest

# Install the required packages
RUN dnf install -y \
      flatpak \
      flatpak-builder \
      p7zip \
      xmlstarlet \
      bzip2 \
      curl \
      jq && \
    dnf clean all

# Add flathub and flathub-beta remotes for flatpak
RUN flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak remote-add --user --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

# Set default command (optional, for testing purposes)
ENTRYPOINT [ "flatpak-builder" ]