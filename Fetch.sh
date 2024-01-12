#!/bin/bash

#Setting the interval in seconds (e.g., 3600 seconds=1hour)
interval=3600

# Function to handle cleanup before exiting
cleanup() {
    echo "Script terminated. Cleaning up..."
    # Add any cleanup actions you may need before exiting
    exit 0
}

# Trap Ctrl+C (SIGINT) and call the cleanup function
trap cleanup SIGINT

#Infinite loop
while true
do 
    echo "----------------------------------------------------------------"
    echo "----------------------------------------------------------------"
    #precompiled C program to fetch data and extract lattude and longitude
    ./my_program
    

    #Printing a timestamp(optional)
    echo "API call made at $(date)"

    ./weather.zsh
    
    #text file generate
    ./generate_report.sh
    echo "----------------------------------------------------------------"
    echo "----------------------------------------------------------------"
    sleep $interval
done
