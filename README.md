# ml-docker

Just another custom docker environment for machine learning and data science projects. Cuda in docker is also supported.

``docker - machine learning - environment - cuda``

[![shields.io](https://img.shields.io/badge/license-Apache2-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.txt)

Author: [Maximilian Bundscherer](https://bundscherer-online.de)

## Overview

- ``scripts/``: Scripts included
- ``docker/``: Docker stuff included

You can use jupyter lab or run python scripts in attached custom docker container.

### Let's get started

- Navigate to scripts folder ``cd scripts/``
- Build docker container ``./build-docker.sh``

#### Jupyter lab mode

- Do all steps in Let's get started (above)
- Start docker container ``./start-jupyter-lab.sh ~/Desktop``
    - Replace ``~/Desktop`` by repo-path without ``/`` at end
- Go to [http://127.0.0.1:50888/lab](http://127.0.0.1:50888/lab)
    - Login with token ``abc``

#### Script mode

- Do all steps in Let's get started (above)
- Start docker container ``./start-script.sh ~/Desktop script.py``
    - Replace ``~/Desktop`` by repo-path without ``/`` at end
    - Replace ``script.py`` by script filename in repo-sub-path
- Read log ``cat run.log``

## A word about docker and cuda

![](./doc-img/nv-stack.png)

- If you want to use cuda inside of a docker container, start ``nvidia-docker`` instead of ``docker``
- If you want to specify which gpus you want to use, add prefix ``NV_GPU=3,4`` (check gpus on server with ``nvidia-smi`` before)
- The scripts in the repo has built-in cuda support (``scripts/start-jupyter-lab.sh`` and ``scripts/start-script.sh``) (but please change which gpus you use)

## Debug section

- Navigate to scripts folder ``cd scripts/``
- ``./check-docker.sh``: Check if docker container is running and check if image is available
- ``./remove-docker.sh``: Remove running docker container and remove image

### Check if torch can use gpus

```
import sys

import torch

print(f"PyTorch Version: {torch.__version__}")
print()
print(f"Python {sys.version}")
print("GPU is", "available" if torch.cuda.is_available() else "NOT AVAILABLE")
```