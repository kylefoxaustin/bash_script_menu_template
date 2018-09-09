# bash_script_menu_template
a simple interactive and command line driven Bash shell script template

originally written by: Nick Waywood.  github: https://gist.github.com/nwaywood
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


