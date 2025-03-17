#!/bin/bash

base_dir="/home/cloudnet/dinushan/ODNS"

# Check if the data directory exists
if [ ! -d $base_dir/data ]; then
    echo "Data directory does not exist. Please extract the data.zip file to the base directory."
    exit 1
fi


# Extract the data to the data directory
unzip -o ./data.zip -d $base_dir/
timestamp=$(date +%s)

echo "Starting simulations for time: $time"
nohup java -jar simulation.jar 50 $base_dir/data $base_dir/data/workload/planetlab/ 1 bfr > $base_dir/logs/${timestamp}.log &
echo "Ending simulations for time: $time"