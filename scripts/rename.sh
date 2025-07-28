#!/bin/bash

#==============================================================================
# FUNCTIONS
#==============================================================================


print_usage() {
    echo "Error: Incorrect arguments provided. " >&2
    echo "Usage: $0 <directory> <prefix>" >&2
}

main() {
    # --- 1. Checks ---
    

    if [ "$#" -ne 2 ]; then
        print_usage
        exit 1
    fi

    local TARGET_DIR=$1
    local PREFIX=$2

    if [ ! -d "$TARGET_DIR" ]; then
        echo "Error: Directory '$TARGET_DIR' not found." >&2
        exit 1
    fi

    if [ -z "$(ls -A "$TARGET_DIR")" ]; then
        echo "Info: Directory '$TARGET_DIR' is empty. Nothing to rename."
        exit 0 
    fi


    for FILE_PATH in "$TARGET_DIR"/*; do
        if [ -f "$FILE_PATH" ]; then
            local FILENAME
            FILENAME=$(basename "$FILE_PATH")
            mv "$FILE_PATH" "$TARGET_DIR/$PREFIX_$FILENAME"
            echo "Renamed '$FILENAME' to '$PREFIX'_'$FILENAME'"  
        fi
    done

    echo "Bulk rename completed."
}

#==============================================================================
# SCRIPT EXECUTION
#==============================================================================

main "$@"
