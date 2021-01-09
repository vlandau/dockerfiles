# Dockerfile to build qgis
# Written by Vincent Landau (vincent@csp-inc.org)

FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \ 
    gnupg2 \
    software-properties-common \
    wget \
    ca-certificates

RUN wget -qO - https://qgis.org/downloads/qgis-2020.gpg.key | gpg \ 
	--no-default-keyring --keyring  \
	gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import

RUN chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg

RUN add-apt-repository "deb https://qgis.org/debian `lsb_release -c -s` main"

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