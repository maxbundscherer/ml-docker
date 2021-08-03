echo "- Check containers"
docker ps -a | grep ml-bundscherer

echo
echo "- Check images"
docker images | grep ml-bundscherer