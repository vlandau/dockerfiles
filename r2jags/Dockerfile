FROM rocker/tidyverse:3.6.1

# JAGS (and rjags) and cleanup
RUN wget http://ftp.debian.org/debian/pool/main/j/jags/jags_4.3.0.orig.tar.gz \
    -P /usr/local && \
    tar xvzf /usr/local/jags_4.3.0.orig.tar.gz -C /usr/local/bin && \
    rm /usr/local/jags_4.3.0.orig.tar.gz && \
    cd /usr/local/bin/JAGS-4.3.0 && \
    ./configure && \
    make && \
    make install && \
    /sbin/ldconfig && \
    R -e "install.packages('R2jags')"