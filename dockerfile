# Start with official PyTorch image (which is based on debian:12)
FROM pytorch/pytorch:2.9.1-cuda12.6-cudnn9-runtime


WORKDIR /workspace

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies including git (important for dev containers)
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python -m venv /opt/venv

# Activate venv and upgrade pip
RUN /opt/venv/bin/pip install --no-cache-dir --upgrade pip setuptools wheel

# Copy requirements file
COPY requirements.txt .

# Install packages in venv
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Environment variables
ENV PATH="/opt/venv/bin:$PATH"
ENV VIRTUAL_ENV="/opt/venv"
ENV PYTHONUNBUFFERED=1

EXPOSE 8888

CMD ["/bin/bash"]