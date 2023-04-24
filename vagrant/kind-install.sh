#!/bin/bash

red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nDownloading kubectl..."$rst
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo -e $grn"\nDone..."$rst

echo -e $grn"\nValidating files..."$rst
sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

echo -e $grn"\nInstalling binary..."$rst
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo -e $grn"\nDone!!!"$rst

echo -e $grn"\nInstalling kind..."$rst
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
echo -e $grn"\nDone..."$rst