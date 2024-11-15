#!/bin/bash

apt update
apt install git -y
apt install openjdk-17-jdk -y
git clone https://github.com/DinushanVimukthi/Simulation.git

base_dir="/home/cloudnet/dinushan/ODNS"
mkdir -p $base_dir/logs

cd Simulation
chmod 777 *
# ./run.sh
nohup ./run.sh > $base_dir/logs/run.log &