#!/usr/bin/env bash
#
#  A script that logs IP
#
#
#
#

URL="http://checkip.dyndns.org"
LOG=$HOME/script.out

# get the url text - ip address
URLTXT=`curl -s http://checkip.dyndns.org`

# carve out the text and append to LOG
OUTPUT=`sed 's/.*<body>\(.*\)<\/body>.*/\1/g' <<< $URLTXT`
DATE=`date`

echo "$DATE | $OUTPUT" >> $LOG
