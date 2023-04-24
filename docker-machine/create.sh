#!/bin/bash

# to delete docker machine run delete.sh in the same console

export DOCKER_MACHINE_NAME="docker-for-jenkins"
export SYNC_FOLDER="jenkins"
export MACHINE_USER="docker"
export ROOT_DIR="/home/roman/git/dip_project"

red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nCreating docker-machine..."$rst
docker-machine create \
    --driver virtualbox \
	--virtualbox-cpu-count "1" \
	--virtualbox-memory "1024" \
"$DOCKER_MACHINE_NAME"
echo -e $grn"\nDone!!"$rst

echo -e $grn"\nCreating sync folder..."$rst
cd "$ROOT_DIR"
docker-machine ssh "$DOCKER_MACHINE_NAME" mkdir "$SYNC_FOLDER"
docker-machine scp -r ./"$SYNC_FOLDER/" "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/"
cd "$HOME"

echo -e $grn"\nCopying sshkey for github..."$rst
docker-machine scp .ssh/jenkins-git "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/.ssh/jenkins-git"
docker-machine ssh "$DOCKER_MACHINE_NAME" "chmod 400 /home/"$MACHINE_USER"/.ssh/jenkins-git"

echo -e $grn"\nCopying PAT for dockerhub..."$rst
docker-machine scp .docker/dockerhub_pat "$DOCKER_MACHINE_NAME":"/home/$MACHINE_USER/.docker/dockerhub_pat"

echo -e $grn"\nIP address:"$rst
docker-machine ip "$DOCKER_MACHINE_NAME"

echo -e $grn"\nTo set up your shell run:"$rst
docker-machine env $DOCKER_MACHINE_NAME | awk 'FNR > 5 {print}' | cut -c 3-