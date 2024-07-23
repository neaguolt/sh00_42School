#!/bin/bash

# Ensure the magic file exists
if [ ! -f ft_magic ]; then
    echo "Custom magic file 'ft_magic' not found!"
    exit 1
fi

# Generate a temporary list of all files
tmpfile=$(mktemp)
find . -type f > "$tmpfile"

# Use the custom magic file to check for "42 file type" files
file -m ft_magic -f "$tmpfile" | grep "42file"

# Clean up the temporary file
rm "$tmpfile"