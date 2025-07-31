#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <old_text> <new_text>" >&2
    exit 1
fi

TARGET_DIR=$1
OLD_TEXT=$2
NEW_TEXT=$3


if [ ! -d "$TARGET_DIR" ]; then
    echo "Warning: Directory '$TARGET_DIR' not found." >&2
    exit 1
fi

echo "Replacing '$OLD_TEXT' with '$NEW_TEXT' in all .sh files in '$TARGET_DIR'..."
echo "--------------------------------------------------"

find "$TARGET_DIR" -type f -name '*.sh' -print0 | xargs -0 sed -i '' "s/$OLD_TEXT/$NEW_TEXT/g"

echo "--------------------------------------------------"
echo "Replacement complete."
