#!/bin/bash

MANIFEST_FILE=$1

if [ "$#" -ne 1 ] || [ ! -f "$MANIFEST_FILE" ]; then
    echo "Usage: $0 <path_to_manifest_file>" >&2
    exit 1
fi

echo "Checking files listed in '$MANIFEST_FILE'..."
echo "--------------------------------------------"

while IFS= read -r FILENAME; do
    if [ -n "$FILENAME" ]; then
        if [ -f "$FILENAME" ]; then
            echo "[  FOUND  ] $FILENAME"
        else
            echo "[  MISSING  ] $FILENAME"
        fi
    fi
done < "$MANIFEST_FILE"

echo "--------------------------------------------"
echo "Check complete."
