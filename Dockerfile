FROM ubuntu:22.04

# Install dependencies for Deadline
RUN apt-get update && apt-get install -y \
    lsb-release \
    libx11-dev \
    libxext-dev \
    mesa-utils

# Copy over the installer.
RUN mkdir /tmp/thinkboxsetup/
COPY installers/DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/

# Run the installer.
RUN /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \
    --repositorydir /mnt/DeadlineRepository10 \
    --noguimode true \
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

WORKDIR /opt/Thinkbox/Deadline10/bin/