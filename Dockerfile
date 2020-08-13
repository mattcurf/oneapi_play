FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# System defaults
RUN apt-get update && apt-get install -y --no-install-recommends \
      software-properties-common \
      ca-certificates \
      wget \
      gnupg-agent 
 
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB && \
    add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"

COPY intel-graphics.list /etc/apt/sources.list.d/intel-graphics.list

RUN apt-get update && apt-get install -y --no-install-recommends \
      intel-media-va-driver-non-free \
      intel-oneapi-onevpl



