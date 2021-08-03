if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

docker run --rm -p 50888:8888 --name ml-bundscherer \
    -e JUPYTER_ENABLE_LAB=yes -v $1:/home/jovyan/work \
    image-ml-bundscherer:latest \
    start-notebook.sh --NotebookApp.token='abc'