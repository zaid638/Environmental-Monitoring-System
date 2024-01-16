#!/bin/bash

#Setting the interval in seconds (e.g., 1 hour = 3600 seconds)
interval=3600

c_program_path="/home/muhammed/Documents/CEW/OEL/request/my_program"
notification_script_path="/home/muhammed/Documents/CEW/OEL/Notification/weather.zsh"
report_script_path="/home/muhammed/Documents/CEW/OEL/report_folder/generate_report.sh"

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
    $c_program_path
    

    #Printing a timestamp(optional)
    echo "API call made at $(date)"

    $notification_script_path
    
    #text file generate
    $report_script_path
    echo "----------------------------------------------------------------"
    echo "----------------------------------------------------------------"
    sleep $interval
done