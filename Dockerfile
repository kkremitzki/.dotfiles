FROM debian:bookworm

RUN useradd --create-home --uid 1000 --user-group --shell /usr/bin/bash debian
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
# TODO Add apt caching/proxy handling
# TODO Add DEBIAN_FRONTEND=noninteractive
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update && apt-get full-upgrade -y && apt-get autoremove -y && \
  apt-get install -y stow vim-nox

ENTRYPOINT ["/usr/bin/su", "-l", "debian"]
