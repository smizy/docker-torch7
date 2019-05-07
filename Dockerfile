FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04

RUN set -x \
    && apt-get update \
    && apt-get install -qy \
        git \
        sudo \
    && git clone https://github.com/torch/distro.git ~/torch --recursive 

RUN set -x \
    && cd ~/torch \
    && bash install-deps \
    && export TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__" \
    && ./clean.sh \
    && ./update.sh 