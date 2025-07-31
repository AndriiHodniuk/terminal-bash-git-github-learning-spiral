#!/bin/bash

LOG_FILE=$1

if [ "$#" -ne 1 ] || [ ! -f "$LOG_FILE" ]; then
    echo "Usage: $0 <path_to_log_file>" >&2
    exit 1
fi

awk '!/^d/ { sum += $5 } END { print "Total size of all regular files:", sum, "bytes" }' "$LOG_FILE"
