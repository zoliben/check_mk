#!/bin/bash

#check of the openstack web url accessibility and response time/code
#last edit: 10/06/2019 - Bence Zoltan

IFS=$'
'
CURL=($(curl -s $1 -o /dev/null -w "@ostack_format" --connect-timeout 2))

#check website responsivity and push it to check_mk graphing
if (( $(echo "${CURL[0]} < 1" | bc -l) )); then
	echo "0 - website_response count1=${CURL[0]} - OK: OpenStack website is responsive"
elif (( $(echo "${CURL[0]} < 2" | bc -l) )); then
	echo "1 - website_response count1=${CURL[0]} - WARN: OpenStack website may be overloaded"
else
	echo "2 - website_response count1=${CURL[0]} - CRIT: OpenStack website is severely overloaded"
fi

#check the http response code
case ${CURL[1]} in
	200|301|302)
		echo "0 - http_code - OK: HTTP response code: ${CURL[1]}";;
	*)
		echo "2 - http_code - CRIT: HTTP response code: ${CURL[1]}";;
esac
