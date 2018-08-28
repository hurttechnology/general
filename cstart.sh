#!/bin/bash

function multilogon {
    echo "Choose the server you want to visit: "
    echo ""
    echo "1. Sandbox 1"
    echo "2. Sandbox 2"
    echo "3. Development"
    echo "4. Integration"
    echo "5. QA 1"
    echo "6. QA 2"
    echo "7. QA 3"
    echo "8. Production 1"
    echo "9. Production 2"
		echo ""
    echo "Enter your choice: "
    read serverchoice

    if [ $serverchoice == 1 ] ; then
      ssh T2214937-SVA@evpmules101.corp.fin
    elif [ $serverchoice == 2 ] ; then
      ssh T2214937-SVA@evpmules102.corp.fin
    elif [ $serverchoice == 3 ] ; then
      ssh T2214937-SVA@evpmuled101.corp.fin
    elif [ $serverchoice == 4 ] ; then
      ssh T2214937-SVA@evpmulet101.corp.fin
    elif [ $serverchoice == 5 ] ; then
      ssh T2214937-SVA@evpmuleq101.corp.fin
    elif [ $serverchoice == 6 ] ; then
      ssh T2214937-SVA@evpmuleq201.corp.fin
    elif [ $serverchoice == 7 ] ; then
      ssh T2214937-SVA@evpmuleq301.corp.fin
    elif [ $serverchoice == 8 ] ; then
      ssh T2214937-SVA@evpmulep101.corp.fin
    elif [ $serverchoice == 9 ] ; then
      ssh T2214937-SVA@evpmulep102.corp.fin
    fi

    #for server in serverlist

}

function menucontrol {
	if [ $1 == 0 ] ; then
		multilogon
  elif [ $1 == 1 ] ; then
    mulectl
  elif [ $1 == 2 ] ; then
		mulectl status
	elif [ $1 == 3 ] ; then
		todoctl
  else
    kickstarter
  fi
}

function todoctl {
	echo ""
  echo ""
  echo "1. View To-do List"
	echo "2. Add to To-do List"
	echo "3. Remove from To-do List"
  echo "4. Back to Kickstarter Main Menu"
	echo "What would you like to do?"
  read todoanswer

	if [ $todoanswer == 1 ] ; then
    echo ""
    echo "Here's what you have going on.."
    echo ""
    cat todo.txt
    todoctl
  fi

  if [ $todoanswer == 2 ] ; then
      echo "Enter a task: "
      read taskname
      echo $taskname >> todo.txt
      echo ""
      echo "Task entered successfully."
      todoctl
  fi

  if [ $todoanswer == 3 ] ; then
      echo "Which task would you like to remove?"
      read taskremove
      echo "Ok. Are you sure you want to remove $taskremove?"
      read taskanswer
      if [ $taskanswer == "Y" ] ; then
        sed -i "/$taskremove/d" todo.txt
      fi
      todoctl
  fi

  if [ $todoanswer == 4 ] ; then
    kickstarter
  fi
}

function kickstarter {

  txtund=$(tput sgr 0 1)          # Underline
  txtbld=$(tput bold)             # Bold

  echo ""
  echo ""
  echo "This is a kickstarter program for the day"
  echo ""

  echo "0. Central Login"
  echo "1. Start MuleCTL"
  echo "2. Analyze Mule systems"
  echo "3. To-do"
  echo "4. Quit"
  echo ""
  echo -e "What would you like to do? "
  echo ""
  read menuanswer
  echo "Ok. You've chosen option $menuanswer. Is that correct? (y for yes, n for no)"
  echo ""
  read verify

  answer="Y"

  if [ "$verify" == "$answer" ] || [ "$verify" == "y" ] ; then
  	menucontrol $menuanswer
  else
  	kickstarter
  fi
}

kickstarter
