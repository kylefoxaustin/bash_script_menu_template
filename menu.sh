#! /bin/bash

# ===================
# Script funtionality
# ===================
# originally written by: Nick Waywood.  github: https://gist.github.com/nwaywood
# updated by: kylefoxaustin.  github: https://github.com/kylefoxaustin
# Provides a basic template for a menu script
# This menu is 'weighted' towards command line operation instead of interactive menu.
# Why?  to get the interactive menu you have to type in "menu.sh -m".  Just typing
# in "menu.s" in the command line gives you usage information
# i will build a new branch
# ===================
# Script Globals
# ===================

# MAXMENU variable stores the number of valid menu action entries (other than usage and help options)
# NOTE: you need to change this variable to the total number of 'doSomething_X()" functions you have
# the purpose of this variable is to capture an error when someone attempts to run the script
# via command line options for directly performing an action.  e.g. if there are 5 menu action items
# and the user enters "menu.sh 6" (indicating they want to run menu action 6 which doesn't exist) the
# script will catch the error and inform the user "no such action"

MAXMENU=1


# ===================
# Script funtionality
# ===================
# FUNCTION: dosomething_1
# note:  for each menu item, you will create a new dosomething_x function
#        e.g. menu item 2 requires a dosomething_2 function here

doSomething_1() {
    echo 'doing something_1'
    read -p "Continue (y/n)?" choice
    case "$choice" in 
	y|Y ) echo "yes";;
	n|N ) echo "no";;
	* ) echo "invalid";;
    esac
}


# ================
# Script structure
# ================

# FUNCTION:  usage
# Show usage via commandline arguments
# note:  change the line Usage: ./example.sh [option] to whatever your
#        script name will be.  e.g. kylemenu.sh
usage() {
  echo "~~~~~~~~~~~"
  echo " U S A G E"
  echo "~~~~~~~~~~~"
  echo "Usage: ./example.sh [option]"
  echo "  options:"
  echo "    -d : do something"
  echo "    -m : Show interactive menu"
  echo "    -h : Show this help"
  echo ""
  exit
}

# FUNCTION: display menu options
# this is the main menu engine to show what you can do
show_menus() {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo " Main Menu"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "  1. Do something"
    echo "  "
    echo "  2. Exit"
    echo ""
}

# FUNCTION:  read menu input selection and take an action
read_options(){
    local choice
    read -p "Enter choice [ 1 - 2 ] " choice
    case $choice in
    1) doSomething_1;;
    2) exit 0;;
    *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

# Use menu...
do_menu() {
  # Main menu handler loop
  while true
  do
    show_menus
    read_options
  done
}

# If no arguments provided, display usage information
[[ $# -eq 0 ]] && usage

# Process command line arguments
if [[ $@ ]]; then
  while getopts "dmh" opt; do
    case $opt in
      d)
	  if [ d -gt $MAXMENU ]; then
	      echo "no such menu action number. please run script without arguments to see usage information"
	      sleep 2
	  else
	      doSomething_$d
	  fi
	  
        shift
        ;;
      m)
      	do_menu
        shift
        ;;
      h)
        usage
        exit 0
        ;;
      \?)
        ;;
    esac
  done
else
  usage
  exit 0
fi
