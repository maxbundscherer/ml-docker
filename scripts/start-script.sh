if [ "$1" = "" ]; then
    echo "Error: Please enter path"
    exit
fi

if [ "$2" = "" ]; then
    echo "Error: Please enter script path"
    exit
fi

if [ "$3" = "" ]; then
    echo "Error: Please enter script file"
    exit
fi

docker run --rm --name ml-bundscherer \
    -v $1:/home/jovyan/work \
    image-ml-bundscherer:latest \
    /bin/bash -c "cd work/$2; python $3" >> log.txt


