#!/bin/bash
set -e

# This is the location where we will place our docker volumes
# Replace /tmp with a more permanent location if desired
VOLUME_PARENT_PATH=/tmp
VOLUME_PATH=${VOLUME_PARENT_PATH}/ci-cd-volumes
GOGS_VOLUME=${VOLUME_PATH}/gogs-data
JENKINS_VOLUME=${VOLUME_PATH}/jenkins-data
APACHE_VOLUME=${VOLUME_PATH}/apache-data

tar -xzvf ci-cd-volumes.tar.gz -C ${VOLUME_PARENT_PATH}
tar -xzvf ci-cd-jenkins-plugins.tar.gz -C ${VOLUME_PARENT_PATH}

# Pull all images
docker pull gogs/gogs
docker pull jenkins
docker pull httpd

# Create network between containers so they can communicate
docker network create cicd-network

# Host ports
GOGS_HTTP_PORT=3000
GOGS_SSH_PORT=10022
JENKINS_HTTP_PORT=8080
APACHE_HTTP_PORT=80

# Start GOGS
docker run -d --net=cicd-network --name gogs-server -v ${GOGS_VOLUME}:/data:z -p ${GOGS_HTTP_PORT}:3000 -p ${GOGS_SSH_PORT}:22 gogs/gogs

# Start Jenkins
docker run -d --net=cicd-network --name jenkins-server -v ${JENKINS_VOLUME}:/var/jenkins_home:z -v ${APACHE_VOLUME}:/var/htdocs:z -p ${JENKINS_HTTP_PORT}:8080 jenkins

# Start Apache HTTPD
docker run -d --net=cicd-network --name httpd-server -v ${APACHE_VOLUME}:/usr/local/apache2/htdocs:z -p ${APACHE_HTTP_PORT}:80 httpd

echo Apache HTTPD url is http://localhost:${APACHE_HTTP_PORT}
echo GOGS  url is http://localhost:${GOGS_HTTP_PORT}
echo Jenkins url is http://localhost:${JENKINS_HTTP_PORT}
