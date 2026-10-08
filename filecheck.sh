#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_check>"
    exit 1
fi

#if you want to ask th path then comment -- path="$1" and uncomment read cmd
#read -p "Enter the path:" path

path="$1"

# Check if the path exists at all
if [ ! -e "$path" ]; then
    echo "Error: The path '$path' does not exist."
    exit 1
fi

# Check the type of the path
if [ -f "$path" ]; then
    echo "'$path' is a regular file."
elif [ -d "$path" ]; then
    echo "'$path' is a directory."
elif [ -L "$path" ]; then
    echo "'$path' is a symbolic link."
elif [ -b "$path" ]; then
    echo "'$path' is a block device."
elif [ -c "$path" ]; then
    echo "'$path' is a character device."
elif [ -p "$path" ]; then
    echo "'$path' is a named pipe."
elif [ -S "$path" ]; then
    echo "'$path' is a socket."
else
    echo "'$path' is of an unknown type."
fi