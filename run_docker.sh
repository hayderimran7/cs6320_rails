#!/bin/bash -x
echo "======================="
echo " This script is for running this rails app via docker container"
echo "======================="

if test -z docker;then
echo "ERROR: docker is not installed on this host"
echo "please install docker as :"
echo "$ apt-get install docker.io"
echo "exiting ..."
exit 1
fi

echo "building the hayderimran7/railsapp image "
docker build -t hayderimran7/railsapp .
echo " image built successfully ."
echo " running the rails app in the container using image hayderimran7/railsapp "
docker stop railsapp || true 2>/dev/null
docker rm railsapp || true 2>/dev/null
docker run --name railsapp -d -p 3000:3000 hayderimran7/railsapp
if [[ $(docker ps | grep "railsapp") ]]; then
echo "docker container started successfully"
echo "Your rails app is running at 0.0.0.0:3000 "
echo "SUCCESS"
else
echo "FATAL: docker container railsapp failed to start !"
echo "see docker logs below for detail"
docker logs railsapp
fi
