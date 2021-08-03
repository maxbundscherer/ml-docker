# ml-docker

Just another custom docker environment for machine learning and data science projects

``docker - machine learning - environment``

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
- Start docker container ``./start-script.sh ~/Desktop src/ script.py``
    - Replace ``~/Desktop`` by repo-path without ``/`` at end
    - Replace ``src/`` by repo-sub-path
    - Replace ``script.py`` by script filename in repo-sub-path
- Read log ``cat run.log``

### Debug section

- Navigate to scripts folder ``cd scripts/``
- ``./check-docker.sh``: Check if docker container is running and check if image is available
- ``./remove-docker.sh``: Remove running docker container and remove image