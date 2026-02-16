# Use Ubuntu 20.04 as requested
FROM ubuntu:20.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Ubuntu 20.04 packages and Shellinabox
RUN apt-get update && apt-get install -y \
    sudo \
    shellinabox \
    firefox \
    curl \
    vim \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 2. Set the 'root' and 'vscode' password to 'Firefox'
# This satisfies your 'newpasswd password Firefox' and 'chpasswd' request
RUN echo "root:Firefox" | chpasswd && \
    useradd -m -s /bin/bash ubuntu || true && \
    echo "ubuntu:Firefox" | chpasswd && \
    adduser ubuntu sudo

# 3. Configure Shellinabox to use /bin/bash and allow root login
# Default port for Shellinabox is 4200
EXPOSE 4200

# 4. Start Shellinabox service
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
