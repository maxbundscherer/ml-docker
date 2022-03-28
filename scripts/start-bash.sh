docker exec \
        -e NB_UID=$user_id \
        image-ml-bundscherer:latest \
        -it /bin/bash
