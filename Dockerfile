FROM sawarae/container_build:py312cuda124
WORKDIR /workdir
COPY requirements.txt /workdir/requirements.txt
SHELL ["conda", "run", "-n", "py312", "/bin/bash", "-c"]
RUN sudo apt update -y && sudo apt install -y ffmpeg
ENV PYTHONPATH=/workdir
RUN conda install -y jupyter
RUN conda install pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
RUN conda install -y tqdm more-itertools conda-forge::tiktoken
RUN conda install -y pytorch::torchtriton
RUN conda install -y numba