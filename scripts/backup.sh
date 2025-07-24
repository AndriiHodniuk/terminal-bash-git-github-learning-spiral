#!/bin/bash

# Checking if exactly one argument has been passed
if [ "$#" -ne 1 ]; then
   echo "Error: Please provide exactly one argument." >&2
   echo "Usage: $0 <path_to_file>" >&2
   exit 1
fi

SOURCE_FILE=$1

# Check if the file exists and if it is a regular file (not a folder)
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File '$SOURCE_FILE' not found or is not a regular file." >&2
    exit 1
fi

BACKUP_DIR="backup"
TIME_STAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a backup folder if it does not exist
echo "Creating folder for backup..."
mkdir -p "$BACKUP_DIR"

# Get a clean file name (no path)
FILENAME=$(basename "$SOURCE_FILE")

EXTENSION="${FILENAME##*.}"
BASE_NAME="${FILENAME%.*}"

echo "File $SOURCE_FILE - is ready for backup..."
echo "----------------------------------------"

if [[ "$FILENAME" == "$BASE_NAME" ]]; then
    NEW_FILENAME="${BASE_NAME}_${TIME_STAMP}"
else
    NEW_FILENAME="${BASE_NAME}_${TIME_STAMP}.${EXTENSION}"
fi

BACKUP_DESTINATION_PATH="$BACKUP_DIR/$NEW_FILENAME"

echo "Backing up '$SOURCE_FILE' to '$BACKUP_DESTINATION_PATH'..."

# Copy a file with a new name in one step
cp "$SOURCE_FILE" "$BACKUP_DESTINATION_PATH"

echo "Backup completed successfully!"
echo "----------------------------------------"




