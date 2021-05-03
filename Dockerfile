ARG PYTHON_VERSION=3.7
# To decide which pytorch and cuda version, please checkout this link:
# https://anaconda.org/pytorch/repo
ARG PYTORCH_VERSION=1.8.1



FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev \
         libglu1 \
         ssh \
         nano \
         htop \
         unzip \
         wget

# Install conda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh
