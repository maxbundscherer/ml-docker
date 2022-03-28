docker exec --name ml-bundscherer \
        -e NB_UID=$user_id \
        -v $1:/home/jovyan/work \
        image-ml-bundscherer:latest \
        -it /bin/bash
