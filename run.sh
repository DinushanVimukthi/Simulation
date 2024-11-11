#!/bin/bash

# Define base directory
base_dir="/home/cloudnet/dinushan/research2"

# Create necessary directories
mkdir -p "$base_dir/logs"

# Extract the data to the data directory
unzip -o ./data.zip -d "$base_dir"

# Define policies
policies=("bf" "bfr" "rrb" "mf" "bfd" "ff")

# Run the simulation for each policy
for policy in "${policies[@]}"
do
    echo "Running simulation for policy: $policy"
    nohup java -Xmx2048m -jar ./simulation.jar 600 "$base_dir/data" "$base_dir/data/workload/planetlab/" 1 "$policy" > "$base_dir/logs/${policy}_1000.log" &
    echo "Simulation is running in the background. Output is being logged to $base_dir/logs/${policy}_1000.log."
done

echo "All simulations have been started with 6 parallel runs."

