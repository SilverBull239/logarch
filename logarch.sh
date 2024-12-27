#!/bin/bash

# Define variables
LOG_DIRECTORY="/var/log"  # Added quotes for safety
ARCH_DIRECTORY="/home/aron-tkachuk/MyBashProjects/logarch/archive"
DATE=$(date +"%Y_%m_%d_%H_%M") 

# Create directory for archive if not present
mkdir -p "$ARCH_DIRECTORY"

# Archive selected logs, append a date time
tar -czf "$ARCH_DIRECTORY/logs_$DATE.tar.gz" -C "$LOG_DIRECTORY" .

# Truncate old log files back to zero, including those in child directories
find "$LOG_DIRECTORY" -type f -name "*.log" -exec sh -c '> "$1"' _ {} \;

# Show archive
ls "$ARCH_DIRECTORY"

# Add crontab option to automate
# To automate this script, you can add it to crontab. 
# For example, to run it daily at 2 AM, you can use:
# 0 2 * * * /path/to/your/script.sh
