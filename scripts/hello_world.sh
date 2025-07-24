#!/bin/bash

# Check if the correct number of arguments was provided.
# We expect exactly 2 arguments.

if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments." >&2
    echo "Usage: $0 <name> <city>" >&2
    exit 1
fi

NAME=$1
CITY=$2

echo "Hello, $NAME from $CITY!"
