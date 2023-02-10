#!/bin/bash

# Array of movie names
movie_names=(
  "Gluc gluc 5000"
  "The Godmother"
  "Non-Fiction Pulp"
  "Hurry Potter and the Chronicles of Narnia"
  "Scam 19"
  "Shaktiwoman"
  "I ran out of ideas"
  "Doctor What"
  "Purple Panther"
  "Jimmy Bond"
)

# Array of file formats
formats=(
  "720p"
  "1080p"
  "BluRay"
  "HDRip"
  "WEB-DL"
)

# Array of release groups
release_groups=(
  "XVID"
  "HDRip"
  "xRip"
  "RARBG"
  "YIFY"
  "FGT"
  "EVO"
)

# Loop through 10 movie names
for ((i=0; i<10; i++))
do
  # Get a random movie name
  movie_name=${movie_names[$((RANDOM%10))]}

  # Get a random year between 1980 and 2022
  year=$((1980 + RANDOM % 43))

  # Get a random file format
  format=${formats[$((RANDOM%5))]}

  # Get a random release group
  release_group=${release_groups[$((RANDOM%7))]}

  # Generate the torrent file name
  torrent_file_name="$movie_name $year $format $release_group"
  
  torrent_file_name=${torrent_file_name// /.}

  # Output the generated torrent file name
  echo "$torrent_file_name"
done
