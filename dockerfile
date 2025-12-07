FROM debian:12

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Pipenv
RUN pip3 install --no-cache-dir pipenv

WORKDIR /workspace

# Copy dependency files first for better caching
COPY Pipfile Pipfile.lock /workspace/

# Install dependencies *system-wide* (NO virtualenv inside container)
RUN pipenv install --system --deploy

# Copy the rest of your project
COPY . /workspace/

EXPOSE 8889

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--ServerApp.allow_root=True"]
