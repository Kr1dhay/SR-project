# SR-Research


**Overview**

Fill in here

**Quickstart**

1. Build docker container - `docker build --tag sr-research .`

2. Mount Repository in Container `docker run -it --rm -p 8888:8888 -v "$(pwd)":/workspace -w /workspace SR-Research jupyter lab --ip=0.0.0.0 --allow-root --no-browser`

3. Paste the link into the browser and run the code on JupiterLab
