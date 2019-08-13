# Dockerfile to build qgis
# Written by Vincent Landau (vincent@csp-inc.org)

FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \ 
    gnupg2 \
    ca-certificates

RUN echo "deb https://qgis.org/ubuntu-ltr bionic main" | tee -a /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    tzdata

RUN apt-get install -y --no-install-recommends \
    qgis \
    python3-qgis \
    qgis-plugin-grass

# Fix time zone to Denver
RUN ln -fs /usr/share/zoneinfo/America/Denver /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

CMD ["qgis"]