# Use an official PyTorch image as the base image
#FROM nvidia/cuda:12.8.0-runtime-ubuntu22.04
FROM nvidia/cuda:12.8.0-base-ubuntu22.04

# Set working directory
WORKDIR /app

RUN apt-get update
RUN apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir --verbose -r requirements.txt

COPY init ./
RUN ./init 0301A

WORKDIR /app/source
RUN ./init 0301A

CMD [ "/bin/bash", "start" ]
