#!/bin/bash

# Check if the target name is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 targetname"
  exit 1
fi

# Target name passed as an argument
targetname=$1

echo "Running tools for target: $targetname"

# Define output directory
output_dir="./results_$targetname"
mkdir -p "$output_dir"

# Run Waymore
waymore_output="$output_dir/waymore_${targetname}_result.txt"
echo "Running Waymore..."
python3 ~/tools/waymore/waymore/waymore.py -i "$targetname" -f -xcc -xav -xus -xvt -mode U -oU "$waymore_output"
echo "Waymore results saved to $waymore_output"

# Run Gospider
gospider_output="$output_dir/gospider_${targetname}_result.txt"
echo "Running Gospider..."
gospider -s "https://$targetname" --js -d 2 --sitemap --robots -w -r -t 30 -q > "$gospider_output"
echo "Gospider results saved to $gospider_output"

# Run Feroxbuster and save all results
feroxbuster_output="$output_dir/feroxbuster_${targetname}_result.txt"
echo "Running Feroxbuster..."
feroxbuster -u "https://$targetname" -x php,html,git,yaml,conf,config,env,log,db,bak,asp,aspx,json,yml -o "$feroxbuster_output"
echo "Feroxbuster results saved to $feroxbuster_output"

# Run URLFinder
urlfinder_input="$output_dir/domain.txt"
echo "$targetname" > "$urlfinder_input"
urlfinder_output="$output_dir/urlfinder_${targetname}_result.txt"
echo "Running URLFinder..."
urlfinder -d "$urlfinder_input" --silent -o "$urlfinder_output"
echo "URLFinder results saved to $urlfinder_output"

# Filter URLs with 200 status and save to separate file
feroxbuster_live_output="$output_dir/feroxbuster_${targetname}_live.txt"
echo "Filtering URLs with 200 status..."
grep "200" "$feroxbuster_output" | grep -oP 'https?://[^\s]+' > "$feroxbuster_live_output"
echo "Live URLs saved to $feroxbuster_live_output"


# Completion message
echo "All operations completed. Results are saved in $output_dir."
