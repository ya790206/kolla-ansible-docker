#!/bin/bash
NAME=$1
TAG=$2
shift
if [[ -z "${NAME// }" ]]
then
  echo "請提供一個參數，作為名字"
  exit
fi
if [[ -z "${TAG// }" ]]
then
  TAG=latest
fi

sudo mkdir -p /etc/$NAME-ansible-docker
sudo mkdir -p /etc/$NAME
sudo docker run -h $NAME-ansible-docker --restart=always --privileged -d --net=host --name $NAME-ansible-docker -v /etc/$NAME:/etc/kolla -v /etc/$NAME-ansible-docker:/etc/kolla-ansible-docker -v /root/kolla-ansible-container-data:/root/data kolla-ansible-docker:$TAG
