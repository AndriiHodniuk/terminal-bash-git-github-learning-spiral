#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

TARGET_DIR=$1

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' not found." >&2
    exit 1
fi

echo "Searching for function definitions in '$TARGET_DIR'..."
echo "--------------------------------------------------"

grep -rn --include='*.sh' "() {" "$TARGET_DIR"

echo "--------------------------------------------------"
echo "Search complete."
