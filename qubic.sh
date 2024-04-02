#!/bin/bash

run_update_and_upgrade() {
    yes | sudo apt update
    yes | sudo apt upgrade
}

download_latest_release() {
    local repo_owner=$1
    local repo_name=$2
    local file_path=$3
    local download_location=$4

    mkdir -p "$download_location"

    if [ -f "$download_location/$file_path" ]; then
        local filename=$(basename "$download_location/$file_path")
        mv "$download_location/$file_path" "$download_location/${filename}.old"
    fi

    local release_info=$(curl -s "https://api.github.com/repos/${repo_owner}/${repo_name}/releases?per_page=1")
    local asset_id=$(echo "$release_info" | jq -r ".assets[] | select(.name == \"$file_path\") | .id")

    if [ -z "$asset_id" ]; then
        echo "Binary file '$file_path' not found in the latest release"
        exit 1
    fi

    local binary_url="https://api.github.com/repos/${repo_owner}/${repo_name}/releases/assets/${asset_id}"

    curl -L -o "$download_location/$file_path" -C - -H "Accept: application/octet-stream" "$binary_url"

    echo "Latest release binary file '$file_path' downloaded to '$download_location'"
}

repo_owner="Qubic-Solutions"
repo_name="rqiner-builds"
file_path="rqiner-aarch64-mobile"
download_location="/qubic"

run_update_and_upgrade
download_latest_release "$repo_owner" "$repo_name" "$file_path" "$download_location"
