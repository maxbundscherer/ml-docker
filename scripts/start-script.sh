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

user_id=`id -u`
echo "- Set NB_UID to $user_id"

docker run --rm --name ml-bundscherer \
    -v $1:/home/jovyan/work \
    -e NB_UID=$user_id \
    --user root \
    image-ml-bundscherer:latest \
    /bin/bash -c "cd work/$2; python $3" > log.txt 2>&1