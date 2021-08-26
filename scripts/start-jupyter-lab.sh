if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

user_id=`id -u`
echo "- Set NB_UID to $user_id"

docker run --rm -p 50888:8888 --name ml-bundscherer \
    -e JUPYTER_ENABLE_LAB=yes -v $1:/home/jovyan/work \
    -e NB_UID=$user_id \
    --user root \
    image-ml-bundscherer:latest \
    start-notebook.sh --NotebookApp.token='abc'