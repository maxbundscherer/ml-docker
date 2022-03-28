# Start Jupter Lab in Docker Container
# $1 = path to data-dir

if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

user_id=`id -u`
echo "- Set NB_UID to $user_id"
echo "- Mount path $1"

# Set gpus / Remove NV_GPU=... if you want to use only cpu
# Use nvidia-docker instead of docker if you want tu use gpu
#NV_GPU=3,4 nvidia-
docker run --rm --name ml-bundscherer \
	-d \
        -e NB_UID=$user_id \
        -p 50888:8888 \
        -v $1:/home/jovyan/work \
        image-ml-bundscherer:latest \
        jupyter lab \
        --allow-root \
        --ip 0.0.0.0 \
        --notebook-dir="/home/jovyan/work" \
        --NotebookApp.token='abc'


docker exec -it ml-bundscherer /bin/bash
docker stop ml-bundscherer

echo "Docker stoped"

# Deprecated, but may useful:
#    -e JUPYTER_ENABLE_LAB=yes \
#    --user root \
