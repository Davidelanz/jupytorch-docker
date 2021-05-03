ARG CUDA_VERSION=10.1
ARG CUDNN_VERSION=7

FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel-ubuntu18.04

ARG PYTHON_VERSION=3.7
# To decide which pytorch and cuda version, please checkout this link:
# https://anaconda.org/pytorch/repo
ARG PYTORCH_VERSION=1.8.1
# An ARG declared before the FROM instruction can’t be used after the FROM. 
# If you want to re-use it you need to declare it without the value as below:
ARG CUDA_VERSION
ARG CUDNN_VERSION
ARG CUDA_TOOLKIT=CUDA_VERSION


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

# Create pytorch environment
RUN  /opt/conda/bin/conda install conda-build && \
     /opt/conda/bin/conda create -y --name pytorch-py${PYTHON_VERSION} python=${PYTHON_VERSION} numpy pyyaml scipy ipython mkl && \
     /opt/conda/bin/conda clean -ya
ENV PATH opt/conda/bin:/opt/conda/envs/pytorch-py${PYTHON_VERSION}/bin:$PATH
RUN conda install --name pytorch-py${PYTHON_VERSION} pytorch=${PYTORCH_VERSION} torchvision torchaudio cudatoolkit=${CUDA_TOOLKIT} -c pytorch -c nvidia

# Add env as default env activated by bash
RUN echo "source /opt/conda/bin/activate" >> ~/.bashrc && \
    echo "conda activate pytorch-py${PYTHON_VERSION}" >> ~/.bashrc

# Install OpenCV-related
RUN conda install --name pytorch-py${PYTHON_VERSION} ffmpeg matplotlib opencv
RUN conda install --name pytorch-py${PYTHON_VERSION} lxml -c anaconda

# Install flask, pandas & other useful stuff
RUN /opt/conda/envs/pytorch-py${PYTHON_VERSION}/bin/pip install easydict ffmpy imutils requests flask onnx seaborn pandas

# Install Jupyter and Node.js (for jupyter extensions)
RUN conda install --name pytorch-py${PYTHON_VERSION} --yes ipython notebook jupyter jupyterlab && conda clean -ya
RUN conda install --name pytorch-py${PYTHON_VERSION} nodejs -c conda-forge --repodata-fn=repodata.json
RUN conda install --name pytorch-py${PYTHON_VERSION} jupyter_contrib_nbextensions -c conda-forge 
# Install jupyterlab_code_formatter
RUN conda install --name pytorch-py${PYTHON_VERSION} jupyterlab_code_formatter -c conda-forge 
RUN conda install --name pytorch-py${PYTHON_VERSION} black isort -c conda-forge 
RUN jupyter labextension enable jupyterlab_code_formatter

EXPOSE 8888

WORKDIR /workspace
RUN chmod -R a+w /workspace

# Install nbdev and add nbdev template to workspace
RUN conda install --name pytorch-py${PYTHON_VERSION} nbdev -c fastai
RUN git clone https://github.com/fastai/nbdev_template.git /workspace/nbdev_template

ENV JUPYTER_COMMAND "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.token='' --ServerApp.terminado_settings={'shell_command':['bash']}"
CMD $JUPYTER_COMMAND
