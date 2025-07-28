#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <prefix>" >&2
    exit 1
fi

TARGET_DIR=$1
PREFIX=$2

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' not found." >&2
    exit 1
fi

for FILE_PATH in "$TARGET_DIR"/*; do
    if [ -f "$FILE_PATH" ]; then
        FILENAME=$(basename "$FILE_PATH")
        mv "$FILE_PATH" "$TARGET_DIR/$PREFIX"_"$FILENAME"
        echo "Renamed '$FILENAME' to '$PREFIX'_'$FILENAME'"  
    fi
done

echo "Bulk rename completed."
