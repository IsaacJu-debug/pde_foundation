#!/bin/bash

# Base directory for downloads
BASE_DIR="/data/pde_data/isaacju.data/camlab_ethz_datasets"

# Create the base directory if it doesn't exist
mkdir -p $BASE_DIR

# Function to download dataset
download_dataset() {
    local dataset=$1
    local dir="$BASE_DIR/$dataset"
    echo "Downloading $dataset to $dir"
    huggingface-cli download "camlab-ethz/$dataset" --repo-type dataset --local-dir "$dir"
}

# List of datasets from the image
datasets=(
    "NS-PwC"
    "NS-BB"
    "NS-SL"
    "NS-SVS"
    "NS-Tracer-PwC"
    "FNS-KF"
    "CE-RPUI"
    "CE-RM"
    "GCE-RT"
    "Wave-Gauss"
    "Wave-Layer"
    "ACE"
    "SE-AF"
    "Poisson-Gauss"
    "Helmholtz"
    "CE-CRP"
    "CE-RP"
    "CE-Gauss"
    "NS-Sines"
    "NS-Gauss"
)

# Download each dataset
for dataset in "${datasets[@]}"; do
    download_dataset "$dataset"
done

echo "All downloads completed."