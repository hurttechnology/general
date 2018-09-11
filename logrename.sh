#!/bin/bash

datetoday=$(date +%Y-%m-%d)
timerun=$(date +%r)

if [ ! -f /opt/mule/intapi-*/logs/logrenametracker.log ]; then
        cd /opt/mule/intapi-*/logs/
        touch logrenametracker.log
        sudo chmod 777 logrenametracker.log
        echo ""
        echo "New log file created.."
else echo "" && echo "Log file already exists.. continuing operation.."
fi

echo ""
echo "Operation started at $timerun.." &  echo "Operation started at $timerun.." >> /opt/mule/intapi-*/logs/logrenametracker.log
echo ""

for folders in /opt/mule/intapi-*; do
  for files in $folders/logs/mule_ee.log.*; do
    datemod=$(date -r $files +%F)
    if [ "$datemod" == $datetoday ]; then
        echo "Nothing to do on [$files].." & echo "Nothing to do on [$files].." >> /opt/mule/intapi-*/logs/logrenametracker.log
    elif [[ "$files" != *"2018-"* ]]; then
        startstr="$files"
        endstr="${startstr:0:44}-${startstr:44:2}-${startstr:46:2}"
        mv $files $endstr
        echo "Success! $files renamed to $endstr.." & echo "Success! $files renamed to $endstr.." >> /opt/mule/intapi-*/logs/logrenametracker.log
    else echo "Nothing to do on [$files].." & echo "Nothing to do on [$files].." >> /opt/mule/intapi-*/logs/logrenametracker.log
    fi
  done

echo "Operation is complete for $folders on $datetoday" & echo "Operation is complete for $folders on $datetoday" >> /opt/mule/intapi-*/logs/logrenametracker.log
done
echo ""
echo ""
