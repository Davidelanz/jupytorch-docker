# Jupytorch | Docker image enabled with Pytorch and Jupyter

[![Docker Image CI](https://github.com/Davidelanz/jupytorch-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/Davidelanz/jupytorch-docker/actions/workflows/docker-image.yml)
[![](https://img.shields.io/badge/Ubuntu-20.04-orange)](https://releases.ubuntu.com/20.04/)
[![](https://img.shields.io/badge/Python-3.7-yellow)](https://www.python.org/downloads/release/python-370/)
[![](https://img.shields.io/badge/PyTorch-1.8.1-green)](https://github.com/pytorch/pytorch/releases/tag/v1.8.1)
[![](https://img.shields.io/badge/CPU_only-yes-green)](#)
[![](https://img.shields.io/badge/CUDA-10.0%7C10.1%7C10.2%7C11.0-green)](#)

Repository for the [davidelanz/jupytorch](https://hub.docker.com/r/davidelanz/jupytorch) docker image. 
It provides a quick set up for Pytorch and Jupyter Lab with Docker.

<!--img src="https://raw.githubusercontent.com/psf/black/master/docs/_static/logo2-readme.png" width="100" /-->
> JupyterLab comes with [jupyterlab_code_formatter](https://jupyterlab-code-formatter.readthedocs.io/)  already installed:
>
> ![](https://raw.githubusercontent.com/Davidelanz/jupytorch-docker/d779bb74b6c4b87f07f1f14080199684744ed2f2/.docs/formatter.png)

## Mount from DockerHub

Download the image from [davidelanz/jupytorch](https://hub.docker.com/r/davidelanz/jupytorch), 
then mount the container (the image exposes JupyterLan on the 8888 port):
```
docker run -p CONTANER_PORT:8888 -v EXTERNAL_FOLDER:/workspace --name CONTAINER_NAME davidelanz/jupytorch:TAG
```

Your workspace will be available at [localhost:CONTANER_PORT](localhost:CONTANER_PORT).

## Build Custom CPU version from GitHub

```
$ git clone https://github.com/davidelanz/jupytorch-docker
$ cd jupytorch-docker/cpu

# choose different PYTHON_VERSION and PYTORCH_VERSION arguments if needed

$ docker build . -t jupytorch/cpu \
    --build-arg PYTHON_VERSION=### \
    --build-arg PYTORCH_VERSION=###
```

## Build Custom GPU version from GitHub

```
$ git clone https://github.com/davidelanz/jupytorch-docker
$ cd jupytorch-docker/gpu

# choose different PYTHON_VERSION, PYTORCH_VERSION and PYTORCH_CUDA_VERSION arguments if needed

$ docker build . -t jupytorch/cpu \
    --build-arg PYTHON_VERSION=### \
    --build-arg PYTORCH_VERSION=### \
    --build-arg PYTORCH_CUDA_VERSION=###
```
