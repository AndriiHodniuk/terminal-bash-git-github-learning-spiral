#!/bin/bash

main() {

   DIRECTORY_PATH=$1
   DAYS=$2

   if [ "$#" -ne 2 ]; then
       echo "Error: Incorrect number of arguments." >&2
       echo "Usage: "$0" <directory_path> <days>" >&2
       exit 1
   fi

   if [ ! -d "${DIRECTORY_PATH}" ]; then
       echo "Directory does not exist." >&2
       echo "Please provide a correct path to the directory." >&2
       exit 1
   fi

   local files=()

   while IFS= read -r file; do
   local files+=("$file")
   done < <(find "$DIRECTORY_PATH" -type f -mtime +"$DAYS") 

   local file_count=${#files[@]}

   if [ "$file_count" -eq 0 ]; then
       echo "No files older than $DAYS days found. Nothing to do."
       exit 0
   fi

   echo "--------------------------------------"
   echo "List of files that match your criteria:"
   for file in "${files[@]}"; do
       echo "$file"
   done
   echo "--------------------------------------"
   read -p "Do you want to delete these files? (y/N)" answer

   if [[ "$answer" == "y" || "$answer" = "Y" ]]; then
       for file in "${files[@]}"; do
           rm "$file"
       done
       echo "Files was deleted."
}

main "$@"


