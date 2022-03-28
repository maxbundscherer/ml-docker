# See ref images in https://hub.docker.com/r/nvidia/cuda
FROM nvidia/cuda:11.4.2-base-ubuntu20.04
# FROM python:3.9 (if you want to use no cuda in docker)

# Workaround: Set region in ubuntu on install auto
# Only required if base img is nvidia/cuda:11.4.2-base-ubuntu20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Install Python3 and Pip
# Only required if base img is NOT python:3.9
RUN apt-get install python3 python3-pip -y

# Install Librosa Dependencies
RUN apt-get install libsndfile1-dev -y

# Install CV2 Dependencies
#RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get python3-opencv

# Alias python -> python3 (required for some libs and scripts)
# Only required if base img is NOT python:3.9
RUN apt-get install python-is-python3 -y

# Install Python requirements with pip
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
