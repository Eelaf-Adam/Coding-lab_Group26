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

#Creating respective directories 
echo "Creating directory..."
mkdir -p heart_data_archive 
mkdir -p temperature_data_archive 
mkdir -p water_usage_data_archive 

#Transfering log file to archive logs 
case $log_selected in
  1) 
     echo "Archiving heart_rate_log.log..."
     #Creation of a variable to include timestamp in the new file name 
     archived_logs_filename="heart_rate_${time_stamp}.log"
     #Moving heart rate log file to archive logs directory and storing it in a new file with time stamp inlcuded in file name 
     mv "${log_files[0]}" "${archive_logs[0]}/${archived_logs_filename}"
     echo "'${log_FILES[0]}' transfered to '${archive_logs[0]}'"
     #Creation of file for continued heart rate monitoring
     touch heart_rate_monitor 
     ;; 
