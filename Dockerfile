# Use Alpine Linux 3.14 as the base image
FROM alpine:3.18.4

# Install dependencies and tools for building Samba
RUN apk --no-cache add build-base python3-dev perl acl-dev linux-headers \
    krb5-dev attr-dev jansson-dev ldb-dev popt-dev talloc-dev tevent-dev \
    gnutls-dev \
    ldb-tools curl

# Download, compile, and install Samba from the official source
WORKDIR /tmp
RUN curl -LO https://download.samba.org/pub/samba/samba-latest.tar.gz && \
    tar -xzf samba-latest.tar.gz && \
    cd samba-*
    #&& \
    #./configure --enable-fhs --prefix=/usr --sysconfdir=/etc --localstatedir=/var && \
    #make && \
    #make install

# Create directory for samba configuration and data
RUN mkdir -p /data/guest

# Copy custom samba configuration to container
#COPY ./setting/smb.conf /etc/samba/smb.conf

# Expose samba ports
#EXPOSE 137/udp 138/udp 139 445

# Clean up
RUN rm -rf /tmp/*

# Run samba in the foreground
#CMD ["smbd", "-FS"]
CMD ["tail","-f", "/dev/null"]
