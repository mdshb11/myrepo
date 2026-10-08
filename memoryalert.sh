#!/bin/bash

# Set the memory usage threshold (in percentage)
THRESHOLD=80

# Get the total memory and used memory
TOTAL_MEMORY=$(free -m | awk '/Mem:/ {print $2}')
USED_MEMORY=$(free -m | awk '/Mem:/ {print $3}')

# Calculate the percentage of used memory
MEMORY_USAGE_PERCENT=$((USED_MEMORY * 100 / TOTAL_MEMORY))

# Check if memory usage exceeds the threshold
if [ "$MEMORY_USAGE_PERCENT" -gt "$THRESHOLD" ]; then
    echo "Memory usage is above the threshold of $THRESHOLD%!"
    echo "Current memory usage: $MEMORY_USAGE_PERCENT%"
    # You can add additional actions here, such as sending an email or logging the event
else
    echo "Memory usage is within the threshold of $THRESHOLD%."
    echo "Current memory usage: $MEMORY_USAGE_PERCENT%"
fi