#!/bin/bash
# Usage: ./change-color --primary --secondary
# script to change the colors on the css template
#
#
# Check the number of command line arguments
# if there is one argument and it says default, set the default colors
if [[ $# -eq 1 ]] && [[ $1 == "default" ]]
then
	primary="2c3e50"
	secondary="1abc9c"
	background="fff"

elif [[ $# -eq 0 ]]
then
	primary="00154f"
	secondary="ffd55a"
	background="f5f0e1"

elif [[ $# -eq 1 ]] && [[ $1 == "blue-yellow" ]]
then
	primary="00154f"
	secondary="ffd55a"
	background="f5f0e1"

elif [[ $# -eq 1 ]] && [[ $1 == "brown-blue" ]]
then
	primary="26495c"
	secondary="c66b3d"
	background="fff"
	
# if there are not two arguments, remind usage
elif [[ $# -ne 2 ]]
then
	echo "Usage: --primary --secondary"
	exit 1

# check if the two arguments are hex
elif [[ (${#1} -ne 6 || ${#2} -ne 6) ]]
then
	echo "At least one of the colors is not hex."
	exit 2

# if all conditions are met, set the colors
else
	primary=$1
	secondary=$2
	background="fff"

fi


# Execute the color subsitution on the styles-template document
sed 's/26495c/'"$primary"'/g; s/c66b3d/'"$secondary"'/g ; s/fff/'"$background"'/g' styles-updated-master.css > styles-updated.css
#

echo Color change operation was successful.
exit 0