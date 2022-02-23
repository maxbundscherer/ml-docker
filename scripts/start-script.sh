# Start Jupter Lab in Docker Container
# $1 = path to data-dir
# $2 = script path

if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

if [ "$2" = "" ]; then
    echo "Error: Please enter script path"
    exit
fi

user_id=`id -u`
echo "- Set NB_UID to $user_id"
echo "- Mount path $1"
echo "- Script file $2"

# Set gpus / Remove NV_GPU=... if you want to use only cpu
# Use nvidia-docker instead of docker if you want tu use gpu
# NV_GPU=3,4 nvidia-docker
docker run --rm --name ml-bundscherer \
        -e NB_UID=$user_id \
        -v $1:/home/jovyan/work \
        image-ml-bundscherer:latest \
        /bin/bash -c "cd /home/jovyan/work; python $2" > log.txt 2>&1

echo
echo "#########################################################"
cat log.txt
echo "#########################################################"

# Deprecated, but may useful:
#    --user root \