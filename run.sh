#!/bin/bash

# Update and install dependencies
apt update
apt install git -y
apt install openjdk-17-jdk -y
git clone <REPOSITORY_URL>

# Define base directory
base_dir="/home/cloudnet/dinushan/ODNS"
mkdir -p $base_dir/logs

# Extract the data to the data directory
unzip -o ./data.zip -d $base_dir/

# Define policies and timestamp
policies=("bf" "bfr" "rrb" "mf" "bfd" "ff")
timestamp=$(date +%s)

# Function to run a simulation for a given time and policies
run_simulation() {
    local time=$1
    echo "Starting simulations for time: $time"
    for policy in "${policies[@]}"
    do
        echo "Running simulation for policy: $policy"
        nohup java -jar ./simulation.jar $time $base_dir/data $base_dir/data/workload/planetlab/ 15 $policy > $base_dir/logs/${timestamp}_${policy}_${time}.log &
    done
    # Wait for all background processes to complete
    wait
    echo "Simulations for time $time completed."
}

# Run simulations sequentially
run_simulation 200
run_simulation 400
run_simulation 600
run_simulation 800
run_simulation 1000


echo "All simulations have completed."
