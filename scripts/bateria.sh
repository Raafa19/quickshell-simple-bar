#!/usr/bin/bash

bat=/sys/class/power_supply/BAT0/
per=$(cat $bat/capacity)
status=$(cat $bat/status)

if [ "$status" = "Charging" ]; then
	echo "0 $per" && exit
elif [ "$per" -gt "80" ]; then
	echo "1 $per" && exit
elif [ "$per" -gt "50" ]; then
	echo "2 $per" && exit
elif [ "$per" -gt "30" ]; then
	echo "3 $per" && exit
else
	echo "4 $per" && exit
fi