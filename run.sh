#!/bin/bash

# Define base directory
base_dir="/home/cloudnet/dinushan/research2"

# Create necessary directories
mkdir -p "$base_dir/logs"

# Extract the data to the data directory
unzip -o ./data.zip -d "$base_dir/data"

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

# Wait for all background jobs to finish
wait

# Timestamp for the archive
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a directory for obtained data if it doesn't exist
mkdir -p "$base_dir/obtained_data"

# Zip all logs and data/output directory with a timestamp
zip -r "$base_dir/obtained_data/${timestamp}_simulation_logs.zip" "$base_dir/logs" "$base_dir/data/output"

mv $base_dir/obtained_data/${timestamp}_simulation_logs.zip ./Simulation

# Move to base directory and push to git
cd Simulation
git add "${timestamp}_simulation_logs.zip"
git commit -m "Added simulation logs and data for $timestamp"
git push

echo "All logs and output data have been zipped, committed, and pushed to the repository."
