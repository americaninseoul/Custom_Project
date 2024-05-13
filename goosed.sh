#!/bin/bash

open ~/Downloads/Goose/Desktop\ Goose.app 

echo "ALLOW TO RUN"

defaults write net.namedfork.DesktopGoose CanAttackAtRandom -bool YES

sleep 8

pgrep -f Goose | xargs kill

# Define the source file
source_file="Desktop Goose.app"

# Base name for copies
base_name="Goose"

# Get current directory
current_dir=$(pwd)

# Loop to copy and open the file 10 times
for i in {1..30}; do
  # Define the destination path with the current number
  destination_path="${current_dir}/${base_name}_$i.app"
  
  # Check if the destination already exists. If it does, skip to the next iteration.
  if [ -d "$destination_path" ]; then
    echo "$destination_path already exists. Opening and skipping to the next number."
    open "$destination_path"
    continue
  fi

  # Copy the file to the new destination
  cp -r "$source_file" "$destination_path"

  # Open the application
  open "$destination_path"
done

sleep 15

osascript GooseAttack.scpt

echo "script complete. will auto kill in 5 ish minutes"

sleep 60

pgrep -f Goose | xargs kill

