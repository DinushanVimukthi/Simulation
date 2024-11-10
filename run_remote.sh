#!/bin/bash

apt update
apt install git -y
apt install openjdk-17-jdk -y
git clone https://github.com/DinushanVimukthi/Simulation.git

cd Simulation
chmod 777 *
./run.sh
