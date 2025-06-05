#!/bin/bash

#Interactive Archival Script

#Creation of reports directory and file
mkdir -p reports
touch reports/analysis_report.txt

#Assigning  variables
choices=("Heart_rate" "temperature" "water_usage")
time_stamp=$(date '+%Y-%m-%d %H:%M:%S')

#creating numbered menu
echo "select log file to analyze: "
echo "1) Heart rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " user_input

case $user_input in
	1) log_files="active_logs/heart_rate_log.log"
	;;
        2) log_files="active_logs/temperature_log.log"
	;;
        3) log_files="active_logs/water_usage_log.log"
	;;
        *) echo "Invalid selection. "
	exit
	;;
esac

echo "Selected file is: $log_files"
#Setting variables for respective time stamps

first_time_stamp_entry=$(head -n 1 "$log_files" | awk '{print $1 " " $2}')
#The command will extract the first ten lines from the head of the log file selected and filter the first two sections, which include date and time

last_time_stamp_entry=$(tail -n 1 "$log_files" | awk '{print $1 " " $2}')
#The command will extract the last  line from the tail of the log file selected and filter the first two sections, which include date and time


#Setting a variable for device counting

device_counter=$(awk '{print $3}' "$log_files" | sort | uniq -c | sort -nr)
#The command will filter out the third row of the log file, counting temperature recorders (A&B), sort them in order, and count them


#Report file outline
echo "REPORT OVERVIEW" >> reports/analysis_report.txt
echo "" >> reports/analysis_report.txt
#Shows the first time stamp, last time stamp, and the current time
echo "TIME REGISTER" >> reports/analysis_report.txt
echo "First_input_access: $first_time_stamp_entry" >> reports/analysis_report.txt
echo "Last_input_access: $last_time_stamp_entry" >> reports/analysis_report.txt
echo "Current_time: $time_stamp" >> reports/analysis_report.txt
echo "" >> reports/analysis_report.txt
#Shows the number of devices used
echo "Number of devices: $device_counter" >> reports/analysis_report.txt
echo "" >> reports/analysis_report.txt
echo "Report overview of '$log_files' completed. "
