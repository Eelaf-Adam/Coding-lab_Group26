#!/bin/bash

#Defining the variables
options=("heart_rate" "temperature" "water_usage")
log_files=("active_logs/heart_rate_log.log" "active_logs/temperature_log.log" "active_logs/water_usage_log.log")
archive_logs=("heart_data_archive" "temperature_data_archive" "water_data_archive")
time_stamp=$(date '+%Y-%m-%d %H:%M:%S')

#Creation of numbered menu
echo "1) heart rate"
echo "2) temperature"
echo "3) water usage"

read -p "Select log to archive: " log_selected

#Creating respective directories
mkdir -p archived_logs 
mkdir -p archived_logs
mkdir -p archived_logs/heart_data_archive
mkdir -p archived_logs/temperature_data_archive
mkdir -p archived_logs/water_data_archive
touch archived_logs/monitoring_files
#Transfering log file to archive logs
case $log_selected in
	1)
     		echo "Archiving heart_rate_log.log..."
     		#Creation of a variable to include timestamp in the new file name
     		archived_logs_filename="heart_rate_${time_stamp}.log"
     		#Moving heart rate log file to archive logs directory and storing it in a new file with time stamp inlcuded in file name
     		mv "${log_files[0]}" "archived_logs/${archive_logs[0]}/${archived_logs_filename}"
     		echo "'${log_files[0]}'successfully transfered to '${archive_logs[0]}'"
     		;;
	2)
		echo "Archiving temperature_log.logs..."
		#Creating of a variable to inclide timestamp in the new file name
		archived_logs_filename="temperature_${time_stamp}.log"
		#Moving temperature log file to archive logs directory and storing it in a new file with time stamp included in file name
		mv "${log_files[1]}" "archived_logs/${archive_logs[1]}/${archived_logs_filename}"
		echo "'${log_files[1]} successfully  transfered to '${archive_logs[1]}'"
		;;
	3)
		echo "Archiving water_usage_log.log..."
		#Creation of a vraiable to include timestamp in the new file name 
		archived_logs_filename="water_usage_${time_stamp}.log"
		#Moving water usage log to archive logs directory and storing it in a new file with time stamp included in file name
		mv "${log_files[2]}" "archived_logs/${archive_logs[2]}/${archived_logs_filename}"
		echo "'${log_files[2]}'successfully  transfered to '${archive_logs[2]}'"
		;;
       *)
	       #Error handling 
	       echo "Invalid selection, please try again"
	       ;;
esac
