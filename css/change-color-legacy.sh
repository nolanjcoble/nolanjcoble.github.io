#!/bin/bash
# Usage: ./change-color --primary --secondary
# script to change the colors on the css template
#
#
# Check the number of command line arguments
# if there is one argument and it says default, set the default colors
if [[ $# -eq 1 ]] && [[ $1 == "default" ]]
then
	primary="c66b3d"
	secondary="26495c"
	background="fff"

elif [[ $# -eq 1 ]] && [[ $1 == "blue-yellow" ]]
then
	primary="00154f"
	secondary="ffd55a"
	background="f5f0e1"

	
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
sed 's/2c3e50/'"$primary"'/g; s/1abc9c/'"$secondary"'/g ; s/fff/'"$background"'/g' styles-template.css > styles-updated.css
#
#
# declare the text to be added and append
echo "
li {
    padding-bottom: 5px
}

.quics-div {		
    height: inherit;		
    width: auto;		
    border-radius: 50%;		
    padding: 10px;		
}	

.quics-div:hover {		
    filter: invert(100%);		
    transition: ease-in 0.1s, ease-out 0.1s		
}	

.QUICS-logo {		
    height: 100%;		
    width: auto;		
    vertical-align: middle;		
    margin-top: -10%		
}	

img.headshot {		
    border-style: 		
}


@media (prefers-color-scheme: dark) {
    body{background-color: rgb(40,40,40);
        color: white
    }
    
    .divider-custom .divider-custom-line {
        background-color: white;
        border-color: white !important;
    }
    
    .divider-custom .divider-custom-icon {
        color: white !important;
        font-size: 2rem;
    }
    
    .text-secondary {
        color: white !important;
    }

    .bg-primary {
  		background-color: rgb(33,33,33) !important;
	}

}" >> styles-updated.css

echo Color change operation was successful.
exit 0