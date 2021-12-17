FROM python:3.9

RUN apt-get update
RUN apt-get install libsndfile1-dev -y

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
