#!/bin/bash

docker stop gogs-server
docker stop jenkins-server
docker stop httpd-server

docker rm gogs-server
docker rm jenkins-server
docker rm httpd-server

docker network rm cicd-network

rm -fr /tmp/ci-cd-volumes

#docker rmi gogs/gogs
#docker rmi httpd
#docker rmi jenkins
