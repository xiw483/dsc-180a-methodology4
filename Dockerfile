# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

# 2) change to root to install packages
USER root

RUN	apt-get install -y aria2
RUN	apt-get install -y nmap
RUN	apt-get install -y traceroute

# 3) install packages
RUN conda install -y geopandas
RUN pip install babypandas

# 4) change back to notebook user
COPY /run_jupyter.sh /
RUN chmod 755 /run_jupyter.sh
USER $NB_UID

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
