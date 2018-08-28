#!/bin/bash

datetoday=$(date +%Y-%m-%d)
timerun=$(date +%r)
echo ""
echo "Operation started at $timerun.." &  echo "Operation started at $timerun.." >> /opt/mule/*/logs/logrenametracker.log
echo ""
echo ""

for files in /opt/mule/*/logs/mule_ee.log.*; do
  datemod=$(date -r $files +%F)
  if [ "$datemod" == $datetoday ]; then
      echo "Nothing to do on [$files].." & echo "Nothing to do on [$files].." >> /opt/mule/*/logs/logrenametracker.log
  elif [[ "$files" != *"-"* ]]; then
      startstr="$files"
      endstr="${startstr:0:16}-${startstr:16:2}-${startstr:18:2}"
      mv $files $endstr
      echo "Success! $files renamed to $endstr.." & echo "Success! $files renamed to $endstr.." >> /opt/mule/*/logs/logrenametracker.log
  else echo "Nothing to do on [$files].." & echo "Nothing to do on [$files].." >> /opt/mule/*/logs/logrenametracker.log
  fi
done
echo ""
echo ""
echo "Operation is complete for $datetoday.." & echo "Operation is complete for $datetoday.." >> /opt/mule/*/logs/logrenametracker.log
echo ""
