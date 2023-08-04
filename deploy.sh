#!/bin/bash

imageName="htmlgraphwebapp:latest"
containerName="htmlgraphwebapp"
dockerImages=$(docker images)

if [[ "{$dockerImages}" == *"{$containerName}"* ]]; then
    echo "The image is already there. Do you want to delete it and rebuild the image (y/n): "
    read deleteImage

    if [[ "${deleteImage}" == "y" ]]; then
        echo "Deleting image..."
        docker stop $container
        docker rm $container
        docker image rm $imageName

        echo "Building image..."
        docker build . -t $imageName                
    else
        echo 'Leaving existing image'
    fi
else
    echo "Building image..."
    docker build . -t $imageName  
fi

echo "Do you want to run the container (y/n): "
read runContainer

if [[ "${runContainer}" == "y" ]]; then
    echo "Running container..."
    docker run -d -p 8080:8080 --name $containerName $imageName              
else
    echo 'Exiting without running container'
fi
