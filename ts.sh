#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "No TypeScript file specified."
    exit 1
fi

# Assign the TypeScript file to a variable
TS_FILE=$1

# Remove the file extension to get the base name
BASE_NAME=$(basename "$TS_FILE" .ts)

# Compile TypeScript to JavaScript
npx tsc "$TS_FILE"

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "TypeScript compilation failed."
    exit 1
fi

# Run the JavaScript file
node "$BASE_NAME.js"

# Check if the node execution was successful
if [ $? -ne 0 ]; then
    echo "Execution of JavaScript file failed."
    exit 1
fi

# Remove the JavaScript file
rm "$BASE_NAME.js"