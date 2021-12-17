# Start Jupter Lab in Docker Container
# $1 = path to data-dir

if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

user_id=`id -u`
echo "- Set NB_UID to $user_id"
echo "- Mount path $1"

docker run --rm --name ml-bundscherer \
        -e NB_UID=$user_id \
        -p 50888:8888 \
        -v $1:/home/jovyan/work \
        image-ml-bundscherer:latest \
        jupyter lab \
        --allow-root \
        --ip 0.0.0.0 \
        --notebook-dir="/home/jovyan/work" \
        --NotebookApp.token='abc'

# Deprecated, but may useful:
#    -e JUPYTER_ENABLE_LAB=yes \
#    --user root \