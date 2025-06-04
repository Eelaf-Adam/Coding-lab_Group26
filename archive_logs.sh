#!/bin/bash

#Defining the variables
options=("heart_rate" "temperature" "water_usage")
log_files=("active_logs/heart_rate_log.log" "active_logs/temperature_log.log" "active_logs/water_usage_log.log")
archive_logs=("heart_data_archive" "temperature_data_archive" "Water_data_archive")
time_stamp=$(date '+%Y-%m-%d %H:%M:%S')

#Creation of numbered menu 
echo "1) heart rate"
echo "2) temperature"
echo "3) water usage"

read -p "Select log to archive: " log_selected


