ARG ARCH=frommakefile
ARG DISTRIB=frommakefile
ARG DOCKERSRC=frommakefile
ARG USERNAME=frommakefile
#
FROM ${USERNAME}/${DOCKERSRC}:${DISTRIB}_${ARCH}
#
ENV SQUID_MAJOR 3
ENV SQUID_MINOR 3.5
ENV SQUID_VERSION 3.5.27
ENV SQUID_DOWNLOAD_SHA256 f6a5f1272000b1c6365652b35f950fd77d091c14076d61812aecac4e90c73b39
#
RUN apt-get update && apt-get -y -q install --no-install-recommends \
    curl openssl build-essential libssl-dev ca-certificates \
    && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN mkdir -p /usr/src/squid \
    && curl -fSL -o squid.tar.gz "http://www.squid-cache.org/Versions/v$SQUID_MAJOR/$SQUID_MINOR/squid-$SQUID_VERSION.tar.gz" \
    && echo "$SQUID_DOWNLOAD_SHA256 *squid.tar.gz" | sha256sum -c - \
    && tar -xzf squid.tar.gz -C /usr/src/squid --strip-components=1 \
    && rm squid.tar.gz \
    && cd /usr/src/squid \
    && ./configure --prefix=/opt/squid --enable-icap-client --enable-ssl --with-openssl --enable-ssl-crtd --enable-auth --enable-basic-auth-helpers="NCSA" \
    && make -j"$(nproc)" \
    && make install \
    && rm -rf /usr/src/squid

COPY squid.conf /opt/squid/

RUN groupadd -g 1000 squid
RUN useradd -g squid -u 1000 -d /squid squid

EXPOSE 3128

ADD entrypoint.sh /opt/squid/entrypoint.sh
RUN chmod 755 /opt/squid/entrypoint.sh
ENTRYPOINT ["/opt/squid/entrypoint.sh"]
