#!/bin/bash

# Base directory for downloads
BASE_DIR="camlab_ethz_datasets"

# Create the base directory if it doesn't exist
mkdir -p $BASE_DIR

# Function to download dataset
download_dataset() {
    local dataset=$1
    local dir="$BASE_DIR/$dataset"
    echo "Downloading $dataset to $dir"
    huggingface-cli download "camlab-ethz/$dataset" --repo-type dataset --local-dir "$dir"
}

# Download each dataset
download_dataset "CE-CRP"
download_dataset "CE-RP"
download_dataset "CE-Gauss"
download_dataset "NS-Sines"
download_dataset "NS-Gauss"

echo "All downloads completed."
