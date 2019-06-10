#!/bin/bash

#checking the status of the openstack modules and formatting them for check_mk
#last edit: 10/06/2019 - Bence Zoltan

IFS=$'
'
STATUS=($(./output.sh))

case ${STATUS[2]} in
	*[Oo][Kk]*)
		echo "0 alpha_status - OK: Alpha service is up and running";;
	*)
		echo "2 alpha_status - FAILED: Alpha service is down"
esac
case ${STATUS[3]} in
	*[Oo][Kk]*)
		echo "0 beta_status - OK: Beta service is up and running";;
	*)
		echo "2 beta_status - FAILED: Beta service is down"
esac
case ${STATUS[4]} in
	*[Oo][Kk]*)
		echo "0 delta_status - OK: Delta service is up and running";;
	*)
		echo "2 delta_status - FAILED: Delta service is down"
esac
case ${STATUS[5]} in
	*[Oo][Kk]*)
		echo "0 gamma_status - OK: Gamma service is up and running";;
	*)
		echo "2 gamma_status - FAILED: Gamma service is down"
esac
