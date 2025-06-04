#!/bin/bash

#Interactive Archival Script

#Creation of reports directory and fil=e
mkdir -p reports
touch reports/analysis_report.txt

#Assigning  variables
choices=("Heart_rate" "temperature" "water_usage")
time_stamp=$(date '+%Y-%m-%d %H:%M:%S')
log_file=("heart_rate.log" "temperature.log" "water_usage.log")
time_

#creating numbered menu
echo "select log file to analyze: "
echo "1) Heart rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " user_input

case $user_input in 
	1) log_files="heart_rate.log"
	;;
        2) log_files="temperature_rate.log"
	;;
        3) log_files="water_usage.log"
	;;
        *) echo "Invalid selection. "
	exit 
	;;
esac

#Error handling in occurance of entry of invalid choice 
if[[$user_input != "1" && $user_input != "2" && $user_input !="3"]];then
       echo "Invalid choice, please try again. " 
       exit 1
fi
#Error handling if the log file called upon does not exist 
if[[!-f "$log_files" ]];then 
       echo "File does not exist, please try again. "
       exit 1
fi    
