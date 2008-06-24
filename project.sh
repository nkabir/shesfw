#!/bin/bash
source config.sh
init;

while getopts "vh" OPT; do
	case $OPT in
	"h")
		usage
		finish 2
		;;
	"v")
		print_msg $PROJECT_NAME" version $PROJECT_VERSION."
		finish 0;
		;;
	"?")
		usage
		finish 2
		;;
	esac
done




finish 0;
