#!/bin/bash

run_update_and_upgrade() {
    echo "Running 'apt update'..."
    sudo apt-get update -y

    echo "Running 'apt upgrade'..."
    sudo apt-get upgrade -y
}

install_packages() {
    sudo apt-get install git nano jq wget -y
}

download_latest_release() {
    local repo_owner=$1
    local repo_name=$2
    local file_path=$3
    local download_location=$4

    # Create directory if it doesn't exist
    mkdir -p "$(dirname "$download_location")"

    if [ -f "$download_location" ]; then

        local filename=$(basename "$download_location")

        mv "$download_location" "$(dirname "$download_location")/${filename}.old"
        echo "Existing file '$filename' renamed to '${filename}.old'"
    fi

    local release_info=$(curl -s "https://api.github.com/repos/${repo_owner}/${repo_name}/releases/latest")

    local binary_url=$(echo "$release_info" | jq -r ".assets[] | select(.name == \"$file_path\") | .browser_download_url")

    if [ -z "$binary_url" ]; then
        echo "Binary file '$file_path' not found in the latest release"
        exit 1
    fi

    curl -L -o "$download_location" -C - "$binary_url"

    echo "Latest release miner file '$file_path' downloaded to '$download_location'"
}

repo_owner="Qubic-Solutions"
repo_name="rqiner-builds"
file_path="rqiner-aarch64-mobile"
download_location="~/qubic"

run_update_and_upgrade
install_packages
download_latest_release "$repo_owner" "$repo_name" "$file_path" "$download_location"
