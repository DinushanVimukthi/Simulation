#!/bin/bash

apt update
apt install git -y
apt install openjdk-17-jdk -y
git clone

#Create Directory on the fly
# /home/cloudnet/dinushan/research2
# Inside the research2 directory, create a new directory called logs.
# Extract the data to the data directory
# And run the following command to run the simulation:
#1000 src/main/resources/data src/main/resources/data/workload/planetlab/ 1 bfd
# Policies = {"bf", "bfr", "rrb", "mf", "bfd", "ff"}
#nohup java -jar simulation.jar 1000 $DATA $DATA/workload/planetlab/ 15 $policy > logs/$policy_1000.log &

# Create a directory
# mkdir -p /home/cloudnet/dinushan/research2/logs
base_dir="/home/cloudnet/dinushan/research2"
mkdir -p $base_dir/logs

# Extract the data to the data directory
# unzip -o ./data.zip -d /home/cloudnet/dinushan/research2/data
unzip -o ./data.zip -d $base_dir/


# Run the simulation
#Policies
policies=("bf" "bfr" "rrb" "mf" "bfd" "ff")

for policy in "${policies[@]}"
do
    echo "Running simulation for policy: $policy"
    nohup java -jar ./simulation.jar 600 $base_dir/data $base_dir/data/workload/planetlab/ 15 $policy > /$base_dir/logs/${policy}_1000.log &
    echo "Simulation is running in the background. Output is being logged to ${base_dir}/logs/${policy}_1000.log."
done

echo "All simulations have been started with 6 parallel runs."
