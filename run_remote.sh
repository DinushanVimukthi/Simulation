#!/bin/bash

apt update
apt install git -y
apt install openjdk-17-jdk -y
git clone https://github.com/DinushanVimukthi/Simulation.git

base_dir="/home/cloudnet/dinushan/ACOVM"
mkdir -p $base_dir/logs
mkdir -p $base_dir/data

cd Simulation
chmod 777 *
# ./run.sh
nohup ./run_algo.sh > $base_dir/logs/run.log &