#!/bin/bash
set -e

# Define the directory where the movie folders are located
directory="./test"

# Loop through all the files in the directory
for file in "$directory"/*
do
  # Check if the file is a directory (i.e. a movie folder)
  if [ -d "$file" ]; then
    # Get the original folder name
    original_name=$(basename "$file")

    # Remove all characters that are not letters or numbers
    cleaned_name=$(echo "$original_name" | tr -cd '[:alnum:] \.' )
    
    # Extract the year from the cleaned name
    year=$(echo "$cleaned_name" | grep -oE '19[0-9]{2}|20[0-9]{2}')

    # Remove everything after the year
    movie_name=$(echo "$cleaned_name" | sed "s/\($year\).*//")

    # Replace dots with spaces
    movie_name=$(echo "$movie_name" | sed -e 's/\./ /g')

    # Remove any leading or trailing spaces from the movie name
    movie_name=$(echo "$movie_name" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Create the final renamed folder name
    renamed_folder="$movie_name ($year)"

    # Rename the folder to the final name
    mv "$file" "$directory/$renamed_folder"

    # Output the original and renamed folder names for confirmation
    echo "$original_name was renamed to $renamed_folder"
  fi
done
