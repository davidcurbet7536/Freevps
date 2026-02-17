# Use Ubuntu base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        shellinabox \
        systemd \
        sudo \
        curl \
        wget \
        nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password (CHANGE THIS!)
RUN echo "root:newpasswd" | chpasswd

# Expose web terminal port
EXPOSE 4200

# Start Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN", "-p", "4200"]
