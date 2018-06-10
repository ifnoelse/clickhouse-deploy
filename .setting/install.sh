#!/usr/bin/env bash
function install {
#   install_pip
#   install_ansible
#   install_docker
}
function install_pip {
    wget https://bootstrap.pypa.io/get-pip.py -O -|python
    wget https://bootstrap.pypa.io/get-pip.py -O -|python3
}
function install_docker {
    apt-get update
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg |apt-key add -
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    apt-get update
    apt-get install -y docker-ce
    groupadd docker
    usermod -aG docker ifnoelse
}
function install_ansible {
    pip install ansible
}

install