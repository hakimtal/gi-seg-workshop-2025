#!/bin/bash

# Check if username is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <kaggle-username>"
    exit 1
fi

USERNAME="$1"  # First argument is the Kaggle username

for dir in */; do
    dir="${dir%/}"

    # Skip if not a directory
    [ -d "$dir" ] || continue

    metadata_path="$dir/dataset-metadata.json"

    # Use original name with underscores for title
    title_name="hausdorf $dir"
    id_name="hausdorf-${dir//_/-}"

    echo "=== Processing folder: $dir ==="
    echo "Title: $title_name"
    echo "ID:    $USERNAME/$id_name"

    # Create metadata inside the folder
    echo "Creating metadata for $dir"
    cat > "$metadata_path" <<EOF
{
  "title": "$title_name",
  "id": "$USERNAME/$id_name",
  "licenses": [{"name": "CC0-1.0"}]
}
EOF

    # Create a temporary folder with only the files we want
    temp_dir="temp_upload_$dir"
    mkdir -p "$temp_dir"

    # Copy only files starting with "models_swa"
    find "$dir" -maxdepth 1 -type f -name "models_swa*" -exec cp {} "$temp_dir/" \;

    # Copy metadata too
    cp "$metadata_path" "$temp_dir/"

    echo "Uploading dataset: $dir"
    kaggle datasets create -p "$temp_dir" --dir-mode zip

    # Clean up
    rm -r "$temp_dir"
done